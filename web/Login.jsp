
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file = "components/Header.jsp" %>
    <body>
        <%@ include file = "components/TopNavBar.jsp" %>
        <div x-show.transition="status || isError"  
             class="bg-slate-200 mx-aut my-auto absolute w-full h-full flex items-center
             shadow-lg overflow-y-auto">
            <div class="container mx-auto rounded p-4 mt-2 overflow-y-auto">
                <div class="bg-white rounded px-8 py-8 max-w-lg mx-auto">           
                    <h1 class="font-bold text-2xl mb-3 text-center" x-text="modalHeaderText">Welcome!</h1>
                    <div :class="{'text-green-700': status, 'text-red-700': isError}" 
                         class="modal-body text-center">
                        <p x-text="modalBodyText"></p>
                    </div>
                    <div class="mt-4">
                        <form method="post" action='j_security_check'>
                            <!--E-mail input-->
                            <div class="relative mb-6">
                                <input type="email" name="j_username"
                                        class="focus:text-black peer block min-h-[auto] w-full rounded border-2 bg-transparent px-3 py-[0.32rem] leading-[1.6] outline-none transition-all duration-200 ease-linear focus:placeholder:opacity-100 data-[te-input-state-active]:placeholder:opacity-100 motion-reduce:transition-none dark:text-neutral-200 dark:placeholder:text-neutral-200 [&:not([data-te-input-placeholder-active])]:placeholder:opacity-0"
                                    id="exampleInputEmail2" aria-describedby="emailHelp"
                                    placeholder="Enter email"/>
                                <label for="exampleInputEmail" class="pointer-events-none absolute left-3 top-0 mb-0 max-w-[90%] origin-[0_0] truncate pt-[0.37rem] leading-[1.6] text-neutral-500 transition-all duration-200 ease-out peer-focus:-translate-y-[0.9rem] peer-focus:scale-[0.8] peer-focus:text-primary peer-data-[te-input-state-active]:-translate-y-[0.9rem] peer-data-[te-input-state-active]:scale-[0.8] motion-reduce:transition-none dark:text-neutral-200 dark:peer-focus:text-primary">Email address</label>
                            </div>

                            <!--Password input-->
                            <div class="relative mb-6" data-te-input-wrapper-init>
                                <input
                                    type="password" name="j_password"
                                    class="focus:text-black peer block min-h-[auto] w-full rounded border-2 bg-transparent px-3 py-[0.32rem] leading-[1.6] outline-none transition-all duration-200 ease-linear focus:placeholder:opacity-100 data-[te-input-state-active]:placeholder:opacity-100 motion-reduce:transition-none dark:text-neutral-200 dark:placeholder:text-neutral-200 [&:not([data-te-input-placeholder-active])]:placeholder:opacity-0"
                                    id="exampleInputPassword2"
                                    placeholder="Password" />
                                <label
                                    for="exampleInputPassword2"
                                    class="pointer-events-none absolute left-3 top-0 mb-0 max-w-[90%] origin-[0_0] truncate pt-[0.37rem] leading-[1.6] text-neutral-500 transition-all duration-200 ease-out peer-focus:-translate-y-[0.9rem] peer-focus:scale-[0.8] peer-focus:text-primary peer-data-[te-input-state-active]:-translate-y-[0.9rem] peer-data-[te-input-state-active]:scale-[0.8] motion-reduce:transition-none dark:text-neutral-200 dark:peer-focus:text-primary"
                                    >Password</label
                                >
                            </div>

                            <div class="grid grid-cols-2">
                                <!--Remember me checkbox-->
                                <!--<div class="mb-6 flex items-center justify-between">-->
                                <div class="ml-auto mr-6">
                                    <input
                                        class="relative float-left -ml-[1.5rem] mr-[6px] mt-[0.15rem] h-[1.125rem] w-[1.125rem] appearance-none rounded-[0.25rem] border-[0.125rem] border-solid border-neutral-300 outline-none before:pointer-events-none before:absolute before:h-[0.875rem] before:w-[0.875rem] before:scale-0 before:rounded-full before:bg-transparent before:opacity-0 before:shadow-[0px_0px_0px_13px_transparent] before:content-[''] checked:border-primary checked:bg-primary checked:before:opacity-[0.16] checked:after:absolute checked:after:-mt-px checked:after:ml-[0.25rem] checked:after:block checked:after:h-[0.8125rem] checked:after:w-[0.375rem] checked:after:rotate-45 checked:after:border-[0.125rem] checked:after:border-l-0 checked:after:border-t-0 checked:after:border-solid checked:after:border-white checked:after:bg-transparent checked:after:content-[''] hover:cursor-pointer hover:before:opacity-[0.04] hover:before:shadow-[0px_0px_0px_13px_rgba(0,0,0,0.6)] focus:shadow-none focus:transition-[border-color_0.2s] focus:before:scale-100 focus:before:opacity-[0.12] focus:before:shadow-[0px_0px_0px_13px_rgba(0,0,0,0.6)] focus:before:transition-[box-shadow_0.2s,transform_0.2s] focus:after:absolute focus:after:z-[1] focus:after:block focus:after:h-[0.875rem] focus:after:w-[0.875rem] focus:after:rounded-[0.125rem] focus:after:content-[''] checked:focus:before:scale-100 checked:focus:before:shadow-[0px_0px_0px_13px_#3b71ca] checked:focus:before:transition-[box-shadow_0.2s,transform_0.2s] checked:focus:after:-mt-px checked:focus:after:ml-[0.25rem] checked:focus:after:h-[0.8125rem] checked:focus:after:w-[0.375rem] checked:focus:after:rotate-45 checked:focus:after:rounded-none checked:focus:after:border-[0.125rem] checked:focus:after:border-l-0 checked:focus:after:border-t-0 checked:focus:after:border-solid checked:focus:after:border-white checked:focus:after:bg-transparent dark:border-neutral-600 dark:checked:border-primary dark:checked:bg-primary dark:focus:before:shadow-[0px_0px_0px_13px_rgba(255,255,255,0.4)] dark:checked:focus:before:shadow-[0px_0px_0px_13px_#3b71ca]"
                                        type="checkbox" value="" id="exampleCheck2" />
                                    <label
                                        class="text-xs inline-block pl-[0.15rem] hover:cursor-pointer"
                                        for="exampleCheck2"> Remember me
                                    </label>
                                </div>

                                <div class="mr-auto ml-6">
                                    <!--Forgot password link-->
                                    <a href="#!" class="text-xs
                                       transition duration-150 ease-in-out hover:text-primary-600
                                       focus:text-primary-600 active:text-primary-700
                                       dark:text-primary-400 dark:hover:text-primary-500
                                       dark:focus:text-primary-500 dark:active:text-primary-600">Forgot password?</a>
                                </div>
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
    </body>

    <%@ include file = "components/Footer.jsp" %>
</html>
