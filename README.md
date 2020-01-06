# Option 1: Docker Hub Usage

Pull Docker image from Docker Hub
```
docker pull jonny9904/docker-sonarqube-custom_profile
```

Start Docker Container from image
```
docker run -d --name docker-sonarqube-custom_profile -p 9000:9000 -p 9002:9002 jonny9904/docker-sonarqube-custom_profile
```

# Option 2: Build Container yourself

Clone Git Repository
```
git clone https://github.com/Thomas-Mildner/docker-sonarqube-custom_profile.git
cd docker-sonarqube-custom_profile
```

Build image
```
docker build -t docker-sonarqube-custom_profile .
```

Run container
```
docker run -d --name docker-sonarqube-custom_profile -v $PWD/qualityprofile:/qualityprofile -p 9000:9000 -p 9002:9002 docker-sonarqube-custom_profile
```

Get logs for container
```
docker logs -f docker-sonarqube-custom_profile
```
