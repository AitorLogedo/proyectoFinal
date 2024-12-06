<div class="card mb-2">
    <div class="card-header">
        <div class="row">
            <div class="col">Webshop</div>
            <div class=" col fs-5 text-end">
                <i class="bi bi-camera-fill"></i>
            </div>
        </div>
    </div>

    <div class="card-body p-0">
        <div id="MyCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#MyCarousel" data-bs-slide-to="0" aria-label="Slide 1" aria-current="true" class="active"></button>
                <button type="button" data-bs-target="#MyCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#MyCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#MyCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
             </div>

            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="{{ asset('img/carousel/001.png') }}" class="d-block w-100" alt="001">
                    <div class="carousel-caption d-none d-md-block">
                        <h4 class="text-dark fw-bold">cupones de descuento</h4>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="{{ asset('img/carousel/002.png') }}" class="d-block w-100" alt="002">
                    <div class="carousel-caption d-none d-md-block">
                        <h4 class="text-dark fw-bold">env&iacute;os r&aacute;pidos nacionales e internacionales</h4>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="{{ asset('img/carousel/003.png') }}" class="d-block w-100" alt="003">
                    <div class="carousel-caption d-none d-md-block">
                        <h4 class="text-dark fw-bold">pagos seguros</h4>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="{{ asset('img/carousel/004.png') }}" class="d-block w-100" alt="006">
                    <div class="carousel-caption d-none d-md-block">
                        <h4 class="text-dark fw-bold">stock de productos garantizado</h4>
                    </div>
                </div>

            </div>

            <button class="carousel-control-prev" type="button" data-bs-target="#MyCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Anterior</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#MyCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Siguiente</span>
            </button>
        </div>
    </div>

    <div class="card-footer">
        <div class="row ">
            <div class="col small">
                <a href="https://www.webshop.com" target="_blank">www.webshop.com</a>
            </div>

            <div class="col small text-end d-none d-md-block">
                Tel&eacute;fono : +34  111-111-111<br />
                Mov&iacute;l : +34 999-999-999
            </div>

            <div class="col text-end">
                Webshop<br />3Tresali<br />33520 Nava</br>Asturias<br />España
            </div>
        </div>
    </div>
</div>

<div class="alert alert-info p-2">
    Bienvenido <b>invitado</b>. Pulsa el
    <button type="button" class="btn btn-sm btn-success text-white" disabled>
        <i class="bi bi-box-arrow-in-right"></i>
    </button>
    bot&oacute;n en la parte superior derecha para acceder a tu area de cliente.
</div>
