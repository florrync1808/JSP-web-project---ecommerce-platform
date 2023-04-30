
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
                    <h1 class="font-bold text-2xl mb-3 text-center" x-text="modalHeaderText">Staff Login</h1>
                    <div :class="{'text-green-700': status, 'text-red-700': isError}" 
                         class="modal-body text-center">
                        <p x-text="modalBodyText"></p>
                    </div>
                    <div class="mt-4">
                        <form>
                            <!--E-mail input-->
                            <div class="relative mb-6">
                                <input type="email"
                                        class="peer block min-h-[auto] w-full rounded border-2 bg-transparent px-3 py-[0.32rem] leading-[1.6] outline-none transition-all duration-200 ease-linear focus:placeholder:opacity-100 data-[te-input-state-active]:placeholder:opacity-100 motion-reduce:transition-none dark:text-neutral-200 dark:placeholder:text-neutral-200 [&:not([data-te-input-placeholder-active])]:placeholder:opacity-0"
                                    id="exampleInputEmail2" aria-describedby="emailHelp"
                                    placeholder="Enter email"/>
                                <label for="exampleInputEmail" class="pointer-events-none absolute left-3 top-0 mb-0 max-w-[90%] origin-[0_0] truncate pt-[0.37rem] leading-[1.6] text-neutral-500 transition-all duration-200 ease-out peer-focus:-translate-y-[0.9rem] peer-focus:scale-[0.8] peer-focus:text-primary peer-data-[te-input-state-active]:-translate-y-[0.9rem] peer-data-[te-input-state-active]:scale-[0.8] motion-reduce:transition-none dark:text-neutral-200 dark:peer-focus:text-primary">Email address</label>
                            </div>

                            <!--Password input-->
                            <div class="relative mb-6" data-te-input-wrapper-init>
                                <input
                                    type="password"
                                    class="peer block min-h-[auto] w-full rounded border-2 bg-transparent px-3 py-[0.32rem] leading-[1.6] outline-none transition-all duration-200 ease-linear focus:placeholder:opacity-100 data-[te-input-state-active]:placeholder:opacity-100 motion-reduce:transition-none dark:text-neutral-200 dark:placeholder:text-neutral-200 [&:not([data-te-input-placeholder-active])]:placeholder:opacity-0"
                                    id="exampleInputPassword2"
                                    placeholder="Password" />
                                <label
                                    for="exampleInputPassword2"
                                    class="pointer-events-none absolute left-3 top-0 mb-0 max-w-[90%] origin-[0_0] truncate pt-[0.37rem] leading-[1.6] text-neutral-500 transition-all duration-200 ease-out peer-focus:-translate-y-[0.9rem] peer-focus:scale-[0.8] peer-focus:text-primary peer-data-[te-input-state-active]:-translate-y-[0.9rem] peer-data-[te-input-state-active]:scale-[0.8] motion-reduce:transition-none dark:text-neutral-200 dark:peer-focus:text-primary"
                                    >Password</label>
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


                    </div>
                </div>
            </div>
        </div>
    </body>

    <%@ include file = "components/Footer.jsp" %>
</html>
