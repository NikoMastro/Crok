
document.addEventListener("DOMContentLoaded", function() {
  const dogData = {
    "Shiba": "Shiba Inu",
    "Shepherd": "German Shepherd",
    "Shih Tzu": "Shih Tzu",
    // Add more breeds as needed
  };

  const breedInput = document.getElementById('breed_autocomplete');

  breedInput.addEventListener('input', function() {
    const query = breedInput.value.toLowerCase();
    const suggestions = Object.keys(dogData).filter(breed => breed.toLowerCase().includes(query));

    const datalist = document.getElementById('breed_suggestions');
    datalist.innerHTML = '';

    suggestions.forEach(breed => {
      const option = document.createElement('option');
      option.value = dogData[breed];
      datalist.appendChild(option);
    });
  });
});
