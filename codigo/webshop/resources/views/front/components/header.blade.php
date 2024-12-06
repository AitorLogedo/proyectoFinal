<header>
    <nav class="navbar bg-secondary fixed-top">
        <div class="container-fluid">
            {{-- left --}}
            <div>
                <a class="btn btn-lg btn-primary text-white me-1" href="https://www.facebook.com/yourcompany/" target="_blank" title="webshop en Facebook" role="button" tabindex="-1">
                    <i class="bi bi-facebook"></i>
                </a>
            </div>

            <a href="/shopping">
                <div class="badge text-bg-success text-wrap fs-5" >
                    <i class="bi bi-bag-heart-fill"></i> Comenzar shopping
                </div>
            </a>
				

            {{-- center --}}
            <div>
                @include('components.switch')
            </div>

            {{-- right --}}
            <div>
                <a class="btn btn-lg btn-success text-white me-1" href="/shopping" title="Home" role="button" tabindex="-1">
                    <i class="bi bi-house-fill"></i>
                </a>

                <a class="btn btn-lg btn-success text-white" href="{{ route('login') }}" title="Login" role="button" tabindex="-1">
                    <i class="bi bi-box-arrow-in-right"></i>
                </a>
            </div>
        </div>
    </nav>
</header>
