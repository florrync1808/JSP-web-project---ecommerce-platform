<style>
    .form-select {
        background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%239ca3af' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
        background-repeat: no-repeat;
        background-position: right 0.5rem center;
        background-size: 1.5em 1.5em;
        -webkit-tap-highlight-color: transparent;
    }

    .submit-button:disabled {
        cursor: not-allowed;
        background-color: #D1D5DB;
        color: #111827;
    }

    .submit-button:disabled:hover {
        background-color: #9CA3AF;
    }

    .credit-card {
        max-width: 420px;
        margin-top: 3rem;
    }

    @media only screen and (max-width: 420px)  {
        .credit-card .front {
            font-size: 100%;
            padding: 0 2rem;
            bottom: 2rem !important;
        }

        .credit-card .front .number {
            margin-bottom: 0.5rem !important;
        }
    }
</style>
<body>


    <div class="credit-card w-full sm:w-min- shadow mx-auto rounded-3xl bg-white" x-data="creditCard">
        <header class="flex flex-col justify-center items-center">
            <div
                class="relative"
                x-show="card === 'front'"
                x-transition:enter="transition ease-out duration-300"
                x-transition:enter-start="opacity-0 transform scale-90"
                x-transition:enter-end="opacity-100 transform scale-100"
                >
                <img class="w-full h-auto" src="https://www.computop-paygate.com/Templates/imagesaboutYou_desktop/images/svg-cards/card-visa-front.png" alt="front credit card">
                <div class="front bg-transparent text-lg w-full text-white px-12 absolute left-0 bottom-12">
                    <p class="number mb-5 sm:text-xl" x-text="cardNumber !== '' ? cardNumber : '0000 0000 0000 0000'"></p>
                    <div class="flex flex-row justify-between">
                        <p x-text="cardholder !== '' ? cardholder : 'Card holder'"></p>
                        <div class="">
                            <span x-text="expired.month"></span>
                            <span x-show="expired.month !== ''">/</span>
                            <span x-text="expired.year"></span>
                        </div>
                    </div>
                </div>
            </div>
            <div
                class="relative"
                x-show="card === 'back'"
                x-transition:enter="transition ease-out duration-300"
                x-transition:enter-start="opacity-0 transform scale-90"
                x-transition:enter-end="opacity-100 transform scale-100"
                >
                <img class="w-full h-auto" src="https://www.computop-paygate.com/Templates/imagesaboutYou_desktop/images/svg-cards/card-visa-back.png" alt="">
                <div
                    class="bg-transparent text-white text-xl w-full flex justify-end absolute bottom-20 px-8  sm:bottom-24 right-0 sm:px-12"
                    >
                    <div class="border border-white w-16 h-9 flex justify-center items-center">
                        <p x-text="securityCode !== '' ? securityCode : 'code'"></p>
                    </div>
                </div>
            </div>
            <ul class="flex">

                <li class="mx-2">
                    <img class="w-14" src="https://www.computop-paygate.com/Templates/imagesaboutYou_desktop/images/verified-by-visa.png" alt="" />
                </li>
                <li class="ml-5">
                    <img class="w-7" src="https://www.computop-paygate.com/Templates/imagesaboutYou_desktop/images/mastercard-id-check.png" alt="" />
                </li>
            </ul>
        </header>
        <main class="mt-4 p-4">
            <h1 class="text-xl font-semibold text-gray-700 text-center">Card payment</h1>
            <div class="">
                <div class="my-3">
                    <input
                        type="text"
                        name="cardHolder"
                        class="block w-full px-5 py-2 border rounded-lg bg-white shadow-lg placeholder-gray-400 text-gray-700 focus:ring focus:outline-none"
                        placeholder="Card holder"
                        maxlength="22"
                        x-model="cardholder"
                        />
                </div>
                <div class="my-3">
                    <input
                        type="text"
                        name="cardNumber"
                        class="block w-full px-5 py-2 border rounded-lg bg-white shadow-lg placeholder-gray-400 text-gray-700 focus:ring focus:outline-none"
                        placeholder="Card number"
                        x-model="cardNumber"
                        x-on:keydown="format()"
                        x-on:keyup="isValid()"
                        maxlength="19"
                        />
                </div>
                <div class="my-3 flex flex-col">
                    <div class="mb-2">
                        <label for="validDate" class="text-gray-700">Valid Thru</label>
                    </div>
                    <div class="grid grid-cols-2 sm:grid-cols-4 gap-2">
                        <select
                            name="expiryDate"
                            id="expiryDate"
                            class="form-select appearance-none block w-full px-5 py-2 border rounded-lg bg-white shadow-lg placeholder-gray-400 text-gray-700 focus:ring focus:outline-none"
                            x-model="expired.month"
                            >
                            <option value="" selected disabled>MM</option>
                            <option value="01">01</option>
                            <option value="02">02</option>
                            <option value="03">03</option>
                            <option value="04">04</option>
                            <option value="05">05</option>
                            <option value="06">06</option>
                            <option value="07">07</option>
                            <option value="08">08</option>
                            <option value="09">09</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                        <select
                            name="expiryYear"
                            id=""
                            class="form-select appearance-none block w-full px-5 py-2 border rounded-lg bg-white shadow-lg placeholder-gray-400 text-gray-700 focus:ring focus:outline-none"
                            x-model="expired.year"
                            >
                            <option value="" selected disabled>YY</option>
                            <option value="2023">2023</option>
                            <option value="2024">2024</option>
                            <option value="2025">2025</option>
                            <option value="2026">2026</option>
                            <option value="2027">2027</option>
                            <option value="2028">2028</option>
                        </select>
                        <input
                            type="text"
                            name="CCV"
                            class="block w-full col-span-2 px-5 py-2 border rounded-lg bg-white shadow-lg placeholder-gray-400 text-gray-700 focus:ring focus:outline-none"
                            placeholder="CCV"
                            maxlength="3"
                            x-model="securityCode"
                            x-on:focus="card = 'back'"
                            x-on:blur="card = 'front'"
                            />
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script>
        document.addEventListener("alpine:init", () => {
            Alpine.data("creditCard", () => ({
                    init() {
                        console.log('Component mounted');
                    },
                    format() {
                        if (this.cardNumber.length > 18) {
                            return;
                        }
                        this.cardNumber = this.cardNumber.replace(/\W/gi, '').replace(/(.{4})/g, '$1 ');
                    },
                    get isValid() {
                        if (this.cardholder.length < 5) {
                            return false;
                        }
                        if (this.cardNumber === '') {
                            return false;
                        }
                        if (this.expired.month === '' && this.expired.year === '') {
                            return false;
                        }
                        if (this.securityCode.length !== 3) {
                            return false;
                        }
                        return true;
                    },
                    
                    cardholder: '',
                    cardNumber: '',
                    expired: {
                        month: '',
                        year: ''
                    },
                    securityCode: '',
                    card: 'front'
                }));
        });
    </script>