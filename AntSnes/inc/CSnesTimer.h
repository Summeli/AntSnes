/* AntSnes
 *
 * Copyright (C) 2009 Summeli <summeli@summeli.fi>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

#ifndef __CGAMETIMER_H__
#define __CGAMETIMER_H__


// INCLUDES
#include <e32base.h>

   
// FORWARD DECLARATIONS
class MSnesTimerObserver;

// CLASS DECLARATION

/**
*  CSnesTimer purpose is to give all possible
*  processing time to SnesController without stalling
*  the operating system
*/

class CSnesTimer 
    : public CBase
    {
    public:
        /// Two-phased constructor
        static CSnesTimer* NewL( MSnesTimerObserver& aObserver );

        /// Two-phased constructor
        /// leaves pointer to cleanup stack
        static CSnesTimer* NewLC( MSnesTimerObserver& aObserver );

        /// Destructor
        ~CSnesTimer();

    private:

        /// Second-phase constructor
        void ConstructL();

        /// Default constructor
        CSnesTimer( MSnesTimerObserver& aObserver );

    public: // New methods:

        /// Starts timer
        void Start( TInt aFrameSkip );

        /// Cancels timer
        void Cancel();

    private: // Private methods

        /// Callback called by CIdle member
        static TInt IdleCallBack( TAny* aPtr );

        static TInt IdleCallBackFrameSkip( TAny* aPtr );
        /// Called by IdleCallBack
        /// @return boolean ETrue continues timer, EFalse stops.
        TInt DoCallAutoFrameSkip();
        
        TInt DoCallFrameSkip();

    private: // data

    	MSnesTimerObserver& iObserver;  // reference to timer observer ( CEngine )
        CIdle*  iIdle;                  // CIdle timer
        TInt iFrameSkip;
        TInt iSkip;
        TInt iCounter;
    };

#endif
