
<div x-show.transition="status || isError"  
     class="bg-slate-200 mx-aut my-auto absolute w-full h-full flex items-center
     shadow-lg overflow-y-auto">
    <div class="container mx-auto rounded p-4 mt-2 overflow-y-auto">
        <div class="bg-white rounded px-8 py-8 max-w-lg mx-auto">           
            <h1 class="font-bold text-2xl mb-3 text-center" x-text="modalHeaderText">User Login</h1>
            <div :class="{'text-green-700': status, 'text-red-700': isError}" 
                 class="modal-body text-center">
                <p x-text="modalBodyText"></p>
            </div>
            <div class="mt-4">
                <form method="post" action='/pepegacoJAVAEE6/view/secureUser/UserLoginPost.jsp'>
                    <!--E-mail input-->
                    <div class="relative mb-6">
                        <label for="email" class="ml-3">Email</label>
                        <input type="text" name="email"
                               class="focus:text-black peer block min-h-[auto] w-full rounded border-2 bg-transparent px-3 py-[0.32rem] leading-[1.6] outline-none transition-all duration-200 ease-linear focus:placeholder:opacity-100 data-[te-input-state-active]:placeholder:opacity-100 motion-reduce:transition-none dark:text-neutral-200 dark:placeholder:text-neutral-200 [&:not([data-te-input-placeholder-active])]:placeholder:opacity-0"
                               placeholder="Username"/>
                        <!--<label class="pointer-events-none absolute left-3 top-0 mb-0 max-w-[90%] origin-[0_0] truncate pt-[0.37rem] leading-[1.6] text-neutral-500 transition-all duration-200 ease-out peer-focus:-translate-y-[0.9rem] peer-focus:scale-[0.8] peer-focus:text-primary peer-data-[te-input-state-active]:-translate-y-[0.9rem] peer-data-[te-input-state-active]:scale-[0.8] motion-reduce:transition-none dark:text-neutral-200 dark:peer-focus:text-primary">Username</label>-->
                    </div>

                    <!--Password input-->
                    <div class="relative mb-6" data-te-input-wrapper-init>
                        <label for="password" class="ml-3">Password</label>
                        <input
                            type="password" name="password"
                            class="focus:text-black peer block min-h-[auto] w-full rounded border-2 bg-transparent px-3 py-[0.32rem] leading-[1.6] outline-none transition-all duration-200 ease-linear focus:placeholder:opacity-100 data-[te-input-state-active]:placeholder:opacity-100 motion-reduce:transition-none dark:text-neutral-200 dark:placeholder:text-neutral-200 [&:not([data-te-input-placeholder-active])]:placeholder:opacity-0"
                            id="exampleInputPassword2"
                            placeholder="Password" />
                    </div>
                    <!--Sign in button-->
                    <button
                        type="submit"
                        @click="location.reload()"
                        class="mt-3 text-lg font-semibold bg-gray-800 w-full
                        text-white rounded-lg px-6 py-3 block shadow-xl
                        hover:text-white hover:bg-black">   
                        Sign in
                    </button>
                </form>


                <!--Register link-->
                <p class="mt-6 text-center text-neutral-800 dark:text-neutral-200">
                    Not a member?
                    <a href="#!" class="text-primary transition duration-150
                       ease-in-out hover:text-primary-600 focus:text-primary-600
                       active:text-primary-700 dark:text-primary-400
                       dark:hover:text-primary-500 dark:focus:text-primary-500
                       dark:active:text-primary-600">Register</a
                    >
                </p>
            </div>
        </div>
    </div>
</div>

