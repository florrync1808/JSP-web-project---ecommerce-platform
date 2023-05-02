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

               <form name="form" action="/pepegacoJAVAEE6/userLoginServlet" method="post" onsubmit="return validate()">
                    <!--E-mail input-->
                    <div class="relative mb-6">
                        <label for="email" class="ml-3">Username</label>
                        <input type="text" name="username"
                               class="focus:text-black peer block min-h-[auto] w-full rounded border-2 bg-transparent px-3 py-[0.32rem] leading-[1.6] outline-none transition-all duration-200 ease-linear focus:placeholder:opacity-100 data-[te-input-state-active]:placeholder:opacity-100 motion-reduce:transition-none dark:text-neutral-200 dark:placeholder:text-neutral-200 [&:not([data-te-input-placeholder-active])]:placeholder:opacity-0"
                               placeholder="Username"/>
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
                    
                    <span class="text-red-500">
                        <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%>
                    </span>
                    
                    <!--Sign in button-->
                    <input
                        type="submit" value="Login"
                        class="mt-3 text-lg font-semibold bg-gray-800 w-full text-white rounded-lg px-6 py-3 block shadow-xl hover:text-white hover:bg-black">   
                    </input>
                </form>

                <script>
                    function validate()
                    {
                        var username = document.form.username.value;
                        var password = document.form.password.value;

                        if (username == null || username == "")
                        {
                            alert("Username cannot be blank");
                            return false;
                        } else if (password == null || password == "")
                        {
                            alert("Password cannot be blank");
                            return false;
                        }
                    }
                </script> 

                <!--Register link-->
                <p class="mt-6 text-center text-neutral-800 dark:text-neutral-200">
                    Not a member?
                    <a href="/pepegacoJAVAEE6/view/Register.jsp" class="text-primary transition duration-150
                       ease-in-out hover:text-primary-600 focus:text-primary-600
                       active:text-primary-700 dark:text-primary-400
                       dark:hover:text-primary-500 dark:focus:text-primary-500
                       dark:active:text-primary-600">Register</a>
                </p>
            </div>
        </div>
    </div>
</div>



