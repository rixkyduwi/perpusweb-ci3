<div class="container">
  <div class="row">
    <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 mt-5 pt-3 pb-3 bg-white from-wrapper">
      <div class="container">
        <h3>Register</h3>
        <hr>
        <?php if ($this->session->flashdata('validation_errors')): ?>
          <div class="alert alert-danger" role="alert">
            <?= $this->session->flashdata('validation_errors'); ?>
          </div>
        <?php endif; ?>
        <form class="" action="<?= base_url() ?>register/proses_register" method="post">
        <div class="row">
          <div class="col-lg-12 form-group">
               <label for="firstname">Cek nis </label>
               <input type="number" name="member_id" id="member_id" class="form-control" placeholder="ID" value="<?= set_value('member_id') ?>"><br>
                    <div class="input-group-append">
                        <button onclick="cekMember()" class="btn btn-outline-secondary" type="button">Check</button>
                    </div>
                  </div>
          
              <div class="col-lg-6 form-group">
               <label for="firstname">First Name</label>
               <input type="text" class="form-control" name="firstname" id="firstname" value="<?= set_value('firstname') ?>">
              </div>
              <div class="col-lg-6 form-group">
               <label for="lastname">Last Name</label>
               <input type="text" class="form-control" name="lastname" id="lastname" value="<?= set_value('lastname') ?>">
              </div>
          
              <div class="col-lg-12 form-group">
               <label for="kelas">Kelas</label>
               <input type="text" class="form-control" name="kelas" id="kelas" value="">
              
</div>
              <div class="col-lg-12 form-group">
               <label for="jurusan">Jurusan</label>
               <input type="text" class="form-control" name="jurusan" id="jurusan" value="">
              </div>
              <div class="col-lg-12 form-group">
               <label for="email">Email</label>
               <input type="email" class="form-control" name="email" id="email" value="<?= set_value('email') ?>">
              </div>
              
              <div class="col-lg-12 form-group">
               <label for="password">Password</label>
               <input type="password" class="form-control" name="password" id="password" value="">
             </div>
             <div class="col-lg-12 form-group">
              <label for="password_confirm">Confirm Password</label>
              <input type="password" class="form-control" name="password_confirm" id="password_confirm" value="">
            </div>
          <?php if (isset($validation)): ?>
            <div class="col-12">
              <div class="alert alert-danger" role="alert">
                <?= $validation->listErrors() ?>
              </div>
            </div>
          <?php endif; ?>
          </div>
<div class="row">
            <div class="col-12 col-sm-4">
              <button type="submit" class="btn btn-primary">Register</button>
            </div>
            <div class="col-12 col-sm-8 text-right">
              <a href="<?= base_url() ?>login">Klik Sini jika sudah memiliki akun</a>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
  
function cekMember() {
    var formData = new FormData();
    formData.append('id', $('#member_id').val());
    $.ajax({
        url: '<?= base_url() ?>register/findMember',
        type: 'POST',
        data: formData,
        success: function (data) {
          console.log(data);
          if (data=="tidak ditemukan"){
            let timerInterval
        Swal.fire({
            title: 'NIS tidak ditemukan',
            timer: 1000,
  dangerMode: true,
            onClose: () => {
                clearInterval(timerInterval)
            }
        }).then((result) => {
            $("#card").addClass("bounceIn");
        })
            $('#sbmtbtn').addClass("disabled");
            $('#sbmtbtn').attr('type','button');
          }
          else if (data=="anda sudah daftar silahkan login"){
            let timerInterval
        Swal.fire({
            title: 'Anda sudah daftar silahkan login...',
            timer: 1000,
            onBeforeOpen: () => {
                Swal.showLoading()
            },
            onClose: () => {
                clearInterval(timerInterval)
            }
        }).then((result) => {
            $("#card").addClass("bounceIn");
        })
            $('#sbmtbtn').addClass("disabled");
            $('#sbmtbtn').attr('type','button');
          }
          else{
            try {
                $('#sbmtbtn').attr('type', 'submit');
                $('#sbmtbtn').removeClass('disabled');
                $('#sbmtbtn').attr('type', 'submit');

                const array = JSON.parse(data);
                const myArray = array['fullname'].split(" ");
                console.log(myArray);
                let word = myArray[0];
                $("#firstname").val(word);
                var lastword = "";
                for (let i in myArray) {
                    if (i == 0) { }
                    else if (parseInt(i) === myArray.length - 1) {  // Fix the condition for the last element
                        lastword += String(myArray[i]);
                    } else {
                        lastword += String(myArray[i]) + " ";
                    }
                }
                $("#lastname").val(lastword);
                $("#kelas").val(array['kelas']);
                $("#jurusan").val(array['jurusan']);
                let timerInterval
        Swal.fire({
            title: 'NIS ditemukan',
            timer: 1000,
            icon: "success",
            onClose: () => {
                clearInterval(timerInterval)
            }
        }).then((result) => {
            $("#card").addClass("bounceIn");
        })
            } catch (error) {
                console.error("Error:", error.message);
                let timerInterval
        Swal.fire({
            title: "Error:"+error.message,
            timer: 1000,
            icon: "danger",
            onClose: () => {
                clearInterval(timerInterval)
            }
        }).then((result) => {
            $("#card").addClass("bounceIn");
        })
                // Handle the error as needed, e.g., display an error message to the user.
            }
          }
          },
        cache: false,
        contentType: false,
        processData: false
    });
}

function cekBuku() {
    var formData = new FormData();
    formData.append('ISBN', $('#ISBN').val());
    $.ajax({
        url: 'http://localhost/katalog/find',
        type: 'POST',
        data: formData,
        success: function (data) {
          var asd = JSON.parse(data);
          $('#judul').val(asd[0]);
          $('#book_id').val(asd[1]);
        },
        cache: false,
        contentType: false,
        processData: false
    });
}

</script>
