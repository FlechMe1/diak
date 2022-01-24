//= require jquery
//= require jquery_ujs
//= require popper
//= require moment
//= require bootstrap
//= require select2
//= require tempusdominus-bootstrap-4
//= require cocoon
//= require bootstrap-toggle
//= require toastr
//= require tinymce-jquery
//= require activestorage
//= require fullcalendar
//= require fullcalendar/locale-all
//= require user-profil


$(document).ready(function(){

  $("[rel='tooltip']").tooltip();

  moment.locale('fr', {
    months : 'Janvier_Février_Mars_Avril_Mai_Juin_Juillet_Août_Septembre_Octobre_Novembre_Décembre'.split('_'),
    monthsShort : 'janv._févr._mars_avr._mai_juin_juil._août_sept._oct._nov._déc.'.split('_'),
    monthsParseExact : true,
    weekdays : 'dimanche_lundi_mardi_mercredi_jeudi_vendredi_samedi'.split('_'),
    weekdaysShort : 'dim._lun._mar._mer._jeu._ven._sam.'.split('_'),
    weekdaysMin : 'Di_Lu_Ma_Me_Je_Ve_Sa'.split('_'),
    weekdaysParseExact : true,
    longDateFormat : {
        LT : 'HH:mm',
        LTS : 'HH:mm:ss',
        L : 'DD/MM/YYYY',
        LL : 'D MMMM YYYY',
        LLL : 'D MMMM YYYY HH:mm',
        LLLL : 'dddd D MMMM YYYY HH:mm'
    },
    calendar : {
        sameDay : '[Aujourd’hui à] LT',
        nextDay : '[Demain à] LT',
        nextWeek : 'dddd [à] LT',
        lastDay : '[Hier à] LT',
        lastWeek : 'dddd [dernier à] LT',
        sameElse : 'L'
    },
    relativeTime : {
        future : 'dans %s',
        past : 'il y a %s',
        s : 'quelques secondes',
        m : 'une minute',
        mm : '%d minutes',
        h : 'une heure',
        hh : '%d heures',
        d : 'un jour',
        dd : '%d jours',
        M : 'un mois',
        MM : '%d mois',
        y : 'un an',
        yy : '%d ans'
    },
    dayOfMonthOrdinalParse : /\d{1,2}(er|e)/,
    ordinal : function (number) {
        return number + (number === 1 ? 'er' : 'e');
    },
    meridiemParse : /PD|MD/,
    isPM : function (input) {
        return input.charAt(0) === 'M';
    },
    // In case the meridiem units are not separated around 12, then implement
    // this function (look at locale/id.js for an example).
    // meridiemHour : function (hour, meridiem) {
    //     return /* 0-23 hour, given meridiem token and hour 1-12 */ ;
    // },
    meridiem : function (hours, minutes, isLower) {
        return hours < 12 ? 'PD' : 'MD';
    },
    week : {
        dow : 1, // Monday is the first day of the week.
        doy : 4  // The week that contains Jan 4th is the first week of the year.
    }
  });


  $('.datetimepicker').datetimepicker({
    format: "DD/MM/YYYY - HH:mm",
    locale: 'fr',
    autoclose: true,
    minuteStep: 30,
    use24hours: true,
    useCurrent: true
  });


  $('#menuToggle').on('click', function(event) {
    $('body').toggleClass('open');
  });

  tinyMCE.init({
    selector: 'textarea.tinymce',
    menubar: false,
    plugins: [
      'advlist autolink lists link image charmap print preview anchor',
      'searchreplace visualblocks code fullscreen',
      'insertdatetime media table paste code uploadimage wordcount'
    ],
    toolbar: 'undo redo | formatselect | ' +
    'bold italic underline | alignleft aligncenter ' +
    'alignright alignjustify | bullist numlist outdent indent | ' +
    'removeformat | image',
    images_upload_url: '/uploader/image',
    /* enable title field in the Image dialog*/
    image_title: true,
    /* enable automatic uploads of images represented by blob or data URIs*/
    automatic_uploads: true,
    /*
      URL of our upload handler (for more details check: https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_url)
      images_upload_url: 'postAcceptor.php',
      here we add custom filepicker only to Image dialog
    */
    file_picker_types: 'image',
    /* and here's our custom image picker*/
    file_picker_callback: function (cb, value, meta) {
      var input = document.createElement('input');
      input.setAttribute('type', 'file');
      input.setAttribute('accept', 'image/*');

      /*
        Note: In modern browsers input[type="file"] is functional without
        even adding it to the DOM, but that might not be the case in some older
        or quirky browsers like IE, so you might want to add it to the DOM
        just in case, and visually hide it. And do not forget do remove it
        once you do not need it anymore.
      */

      input.onchange = function () {
        var file = this.files[0];

        var reader = new FileReader();
        reader.onload = function () {
          /*
            Note: Now we need to register the blob in TinyMCEs image blob
            registry. In the next release this part hopefully won't be
            necessary, as we are looking to handle it internally.
          */
          var id = 'blobid' + (new Date()).getTime();
          var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
          var base64 = reader.result.split(',')[1];
          var blobInfo = blobCache.create(id, file, base64);
          blobCache.add(blobInfo);

          /* call the callback and populate the Title field with the file name */
          cb(blobInfo.blobUri(), { title: file.name });
        };
        reader.readAsDataURL(file);
      };

      input.click();
    },
  });

  $('.remove_fields').on('click', function(e){
    $(this).parents('.gratitude').fadeOut(500, function(){
      $(this).removeClass('d-flex').addClass('d-none');
    });
  });

  init_check_all();


});

function init_check_all(){
  $('.select_all_access').on('click', function(e){
    e.preventDefault();

    $('.form-check-input').each(function(){
      $(this).attr('checked', true);
    });
  });
}

function init_fullCalendar(selector, sources, selectable){
  $(selector).fullCalendar({
    locale: 'fr',
    themeSystem: 'bootstrap4',
    selectable: selectable,
    eventSources: sources,
    displayEventTime: true,
    timeFormat: 'H:mm',

    select: function(startDate, endDate){
      $.ajax({
        url: '/events/new.js',
        data: {start_at: startDate.format(), end_at: endDate.format()}
      });
    },

    eventClick: function(calEvent, jsEvent, view) {
      jsEvent.preventDefault();
      $.ajax({
        url: calEvent.url
      });
    }

  });
}