<div class="relative ml-3"  x-data="{ open: false }">
    <button type="button"  @click="open = ! open" class="flex rounded-full bg-gray-800 text-sm focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800" >
        <svg class="h-8 w-8 rounded-full" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512" xml:space="preserve" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path style="fill:#E5E5E5;" d="M256,0C114.616,0,0,114.616,0,256s114.616,256,256,256s256-114.616,256-256S397.384,0,256,0z"></path> <path style="fill:#FFFFFF;" d="M256,466.432c-116.032,0-210.432-94.4-210.432-210.432S139.968,45.568,256,45.568 S466.432,139.968,466.432,256S372.032,466.432,256,466.432z M256,61.568C148.792,61.568,61.568,148.792,61.568,256 S148.792,450.432,256,450.432S450.432,363.208,450.432,256S363.208,61.568,256,61.568z"></path> <path d="M256,118.76c22.216,0,40.296,18.08,40.296,40.296s-18.08,40.296-40.296,40.296s-40.296-18.08-40.296-40.296 C215.704,136.84,233.776,118.76,256,118.76 M256,102.76c-31.088,0-56.296,25.208-56.296,56.296s25.208,56.296,56.296,56.296 s56.296-25.208,56.296-56.296S287.088,102.76,256,102.76L256,102.76z"></path> <path d="M189.24,245.448l39.096,84.76h-70.448v-48.664C157.888,256.088,176.632,248.008,189.24,245.448 M198.944,228.288 c0,0-57.056,0.76-57.056,53.256s0,64.664,0,64.664s111.072,0,111.456,0L198.944,228.288L198.944,228.288z M253.336,346.208 L253.336,346.208L253.336,346.208L253.336,346.208z"></path> <path d="M322.768,245.44c12.336,2.52,31.344,10.552,31.344,36.104v48.664h-70.448L322.768,245.44 M313.056,228.288l-54.392,117.92 l0,0H370.12c0,0,0-12.176,0-64.664C370.112,229.048,313.056,228.288,313.056,228.288L313.056,228.288z"></path> <polygon style="fill:#F00000;" points="256,228.288 216.824,228.288 256,315.016 295.176,228.288 "></polygon> </g></svg>
    </button>

    <!--Dropdown menu, show/hide based on menu state.-->
    <div class="absolute right-0 z-10 mt-2 w-48 origin-top-right rounded-md bg-white py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none" x-show="open" @click.outside="open = false">
        <a href="Login.jsp" class="block px-4 py-2 text-sm text-gray-700" tabindex="-1">User Sign In</a>        
        <a href="Register.jsp" class="block px-4 py-2 text-sm text-gray-700" tabindex="-1">New User Sign Up</a>        
        <a href="AdminLogin.jsp" class="block px-4 py-2 text-sm text-gray-700" tabindex="-1">Admin Sign In</a>        
    </div>
</div>