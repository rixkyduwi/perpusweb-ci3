function proses_login() {

    var email = $("[name='email']").val();
    var pwd = $("[name='pwd']").val();

    if (email == "") {
        validasi('Email masih kosong!', 'warning');
        return false;
    } else if (pwd == '') {
        validasi('Password masih kosong!', 'warning');
        return false;
    } else{
        cek_user(email, pwd);
    }

}

function cek_user(email, pwd){
    var link = $('#baseurl').val();
    var base_url = link + 'login/proses_login';
    console.log(base_url)
    $("#login").text("Memuat...");
    var datajson = {
        email:email,
        password:pwd
    };
    console.log(datajson)
    $.ajax({
        type: 'POST',
        url: base_url,
        contentType: 'application/json',
        data: JSON.stringify(datajson),
        success: function(hasil) {
            console.log(hasil);
            if(hasil.respon == 'success'){
                pesan('Berhasil Login!', 'success', 'true');
                $("#login").text("Login");
            }else{
                pesan(hasil.message , 'error', 'false');
                $("#login").text("Login");
                
            }
        },
        error: function(request, status, error) {
            console.log(request)
            console.log(status)
            pesan('server error!'+error, 'error', 'false');
            $("#kirim").text("Submit");    
        }
    });

}

function logout(){

    swal.fire({
        title: "Anda ingin logout?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: 'Iya',
        confirmButtonColor: '#4e73df',
    }).then((result) => {
        if (result.value) {
            proses_logout();
        }
    });

}

function proses_logout(){
    var link = $('#baseurl').val();
    var base_url = link + 'login/logout';

    $.ajax({
        type: 'POST',
        url: base_url,
        dataType: 'json',
        success: function(hasil) {
            if(hasil.respon == 'success'){
                pesan('Berhasil Logout!', 'success', 'true');
            }
        }
    });
}

function pesan(judul, status, boolean) {
    swal.fire({
        title: judul,
        icon: status,
        confirmButtonColor: '#4e73df',
        showConfirmButton: true,
    }).then((result) => {
        if(boolean == 'true'){
            Swal.fire({
                title: 'Memuat...',
                onBeforeOpen: () => {
                    Swal.showLoading()
                },
            });
            location.reload(true);
        }
    });
}

function validasi(judul, status) {
    swal.fire({
        title: judul,
        icon: status,
        confirmButtonColor: '#4e73df',
    }).then((result) => {

    });
}