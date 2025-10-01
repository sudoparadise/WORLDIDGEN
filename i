<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Ultimate DL Generator</title>
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <link rel="stylesheet" href="base.css">
  <link rel="stylesheet" href="71787399aabd7134.css">
  <link rel="stylesheet" href="attention.css">
  <link rel="stylesheet" href="fade.css">
  <link rel="stylesheet" href="bounce.css">
  <link rel="stylesheet" href="flip.css">
  <link rel="stylesheet" href="slide.css">
  <link rel="stylesheet" href="rotate.css">
  <link rel="stylesheet" href="zoom.css">
  <link rel="stylesheet" href="jquery.rprogessbar.css">
  <link rel="stylesheet" href="css2.css">
  <link rel="icon" href="favicon.ico" type="image/x-icon">
  <style>
    body { background: #20232a; color: #ebecf0; font-family: 'Segoe UI',Arial,sans-serif; }
    .container { max-width: 1300px; margin: 26px auto; background: #232b39; padding: 38px 32px; border-radius: 18px; box-shadow: 0 8px 40px #000d; }
    .top-nav { display: flex; align-items: center; gap: 16px; margin-bottom: 32px;}
    .top-nav img { height: 42px; border-radius: 6px; }
    h2 { font-size: 1.18em; margin-top:0; margin-bottom:25px;}
    .row { display: flex; gap: 18px; margin-bottom: 14px; }
    .field { flex: 1; }
    label { color: #82cfff; font-weight: 500; margin-bottom: 2px; display:block;}
    select, input, button { background: #24273c; border: 1px solid #334; color: #fff; border-radius: 6px; padding:10px 8px; min-width:56px;}
    select:focus,input:focus { outline: 1.5px solid #82cfff; }
    .output-img, .preview img { background: #101A; border-radius:13px; margin-bottom:14px; }
    .output-img { width:329px; margin:0 16px 0 0; display:inline-block;}
    #signature-canvas { border: 2px solid #aaa; background: #fff; }
    .btn-big { width:30%; padding:15px 0;font-size:1.16em;margin-right:14px;background:#2b92f7;}
    .btn-big:last-child { margin-right: 0; }
    .preview-wrap { display: flex;justify-content:center;align-items:flex-start;gap:60px;margin-top:32px;}
    .section-head { font-size:1.15em; margin:7px 0 12px 0;}
    .flexcol { display:flex;flex-direction:column;}
    .upload-blk { margin-top:7px;}
    .random-btn {background:#b48fef;}
    .draw-btn {background:#10c84c;}
    .edit-btn {background:#ffea00; color:#28232a;}
    .meta-btn {background:#ffac30;}
    .realid-btn {background:#fcf505; color:#23232a;}
    .notfed-btn {background:#606c82;}
    .barcode-img { width:137px; }
  </style>
</head>
<body>
  <div class="container">
    <div class="top-nav">
      <img src="GN-icon.jpg" alt="Logo">
      <span style="font-size:1.19em;">Ultimate Multi-Nation Driver/ID Generator</span>
      <img src="icons8-support-96.jpg" alt="Support">
      <img src="historyic.jpg" alt="History">
      <img src="realidA.jpg" alt="REAL ID" style="height:32px;">
    </div>
    <form id="idForm" autocomplete="off" enctype="multipart/form-data">
      <div class="row">
        <div class="field">
          <label for="country">Country</label>
          <select id="country" required>
            <option value="USA" selected>USA</option>
            <option value="Canada">Canada</option>
            <option value="Germany">Germany</option>
            <option value="UK">United Kingdom</option>
            <option value="France">France</option>
            <!-- Expand with more -->
          </select>
        </div>
        <div class="field">
          <label for="state">State/Province</label>
          <select id="state" required>
            <option>Alabama</option><option>Alaska</option><option>Arizona</option><option>California</option>
            <option>Colorado</option><option>Florida</option><option>New York</option>
            <option>Kansas</option><option>Texas</option>
            <!-- Fill in all/most US states, CA provinces, etc -->
          </select>
        </div>
        <div class="field">
          <label for="doctype">Doc Type</label>
          <select id="doctype">
            <option>DL</option>
            <option>CDL</option>
            <option>Passport</option>
          </select>
        </div>
        <button type="button" class="meta-btn" onclick="alert('metadata shown')">METADATA</button>
        <input style="max-width:112px;" placeholder="SSN">
      </div>
      <div class="row">
        <input class="field" placeholder="First Name" id="firstNameId"><input class="field" placeholder="Middle Name"><input class="field" placeholder="Last Name" id="lastNameId">
        <button type="button" class="random-btn" onclick="randomName()">RANDOM</button>
      </div>
      <div class="row">
        <input class="field" placeholder="City"><input class="field" placeholder="Street"><input class="field" placeholder="ZIP-Code">
        <button type="button" class="random-btn" onclick="randomAddress()">RANDOM</button>
      </div>
      <div class="row">
        <select class="field"><option>Alaskan or American Indian</option><option>Asian</option></select>
        <select class="field"><option>Hologram</option><option>None</option></select>
        <button type="button" class="realid-btn">REAL ID</button>
        <button type="button" class="notfed-btn">NOT FOR FEDERAL IDENTIFICATION</button>
      </div>
      <div class="row">
        <input class="field" placeholder="Issue Date"><input class="field" placeholder="Expiry Date"><input class="field" placeholder="MMDDYYYY">
        <button type="button" class="random-btn">CALC</button>
      </div>
      <div class="row">
        <input class="field" placeholder="DOC Discriminator"><input class="field" placeholder="ID Number">
        <button type="button" class="random-btn" onclick="randomDoc()">RANDOM</button>
      </div>
      <div class="row">
        <select class="field"><option>Endorsement</option></select>
      </div>
      <div class="preview-wrap">
        <div class="flexcol">
          <label>Photo</label>
          <button type="button" class="random-btn" onclick="randomPhoto()">RANDOM</button>
          <input type="file" class="upload-blk" id="photoInput" accept="image/*">
          <img id="photoPreview" src="1.jpg" class="output-img" alt="Photo Preview">
        </div>
        <div class="flexcol">
          <label>Signature</label>
          <button type="button" class="random-btn" onclick="randomSignature()">RANDOM</button>
          <input type="file" class="upload-blk" id="signatureInput" accept="image/*">
          <canvas id="signature-canvas" width="228" height="68" style="margin:7px 0;"></canvas>
          <button type="button" class="edit-btn" onclick="clearSignature()">EDIT</button>
          <button type="button" class="draw-btn" onclick="enableDraw()">DRAW</button>
          <img id="signaturePreview" src="JohnWick.jpg" style="width:178px;">
        </div>
      </div>
      <div style="margin:30px 0 14px 0;">
        <div class="section-head">Example:</div>
        <img id="dlExample" src="Alabama_2014.jpg" class="output-img" alt="DL Example">
        <img id="barcodeExample" src="usadl.jpg" class="barcode-img" alt="Barcode Example">
      </div>
      <div>
        <button class="btn-big" type="button" onclick="alert('Document generated!')">GENERATE</button>
        <button class="btn-big" type="button" onclick="alert('Scan generated!')">GENERATE SCAN</button>
        <button class="btn-big" type="button" onclick="alert('Photo generated!')">GENERATE PHOTO</button>
      </div>
    </form>
  </div>
  <script src="sign.js"></script>
  <script src="main.js"></script>
  <script src="gen.js"></script>
  <script src="js"></script>
  <script src="4bd1b696-331040359bebf367.js"></script>
  <script>
    // Demo logic - expand for full generator functions
    function randomName() { document.getElementById('firstNameId').value='John'; document.getElementById('lastNameId').value='Wick'; }
    function randomAddress() {}
    function randomPhoto(){ document.getElementById('photoPreview').src='1.jpg'; }
    function randomSignature(){ document.getElementById('signaturePreview').src='JohnWick.jpg'; }
    function clearSignature(){ var ctx=document.getElementById('signature-canvas').getContext('2d'); ctx.clearRect(0,0,228,68);}
    function enableDraw(){}
    function randomDoc(){}
    // Connect this to your real logic in main.js/gen.js/etc
  </script>
</body>
</html>
