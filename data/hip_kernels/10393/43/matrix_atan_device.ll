; ModuleID = '../data/hip_kernels/10393/43/main.cu'
source_filename = "../data/hip_kernels/10393/43/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @matrix_atan(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp ult i32 %12, %2
  br i1 %13, label %14, label %49

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 %15
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !7, !amdgpu.noclobber !5
  %18 = tail call double @llvm.fabs.f64(double %17)
  %19 = fcmp ogt double %18, 1.000000e+00
  %20 = fdiv double 1.000000e+00, %18
  %21 = select i1 %19, double %20, double %18
  %22 = fmul double %21, %21
  %23 = tail call double @llvm.fma.f64(double %22, double 0x3EEBA404B5E68A13, double 0xBF23E260BD3237F4)
  %24 = tail call double @llvm.fma.f64(double %22, double %23, double 0x3F4B2BB069EFB384)
  %25 = tail call double @llvm.fma.f64(double %22, double %24, double 0xBF67952DAF56DE9B)
  %26 = tail call double @llvm.fma.f64(double %22, double %25, double 0x3F7D6D43A595C56F)
  %27 = tail call double @llvm.fma.f64(double %22, double %26, double 0xBF8C6EA4A57D9582)
  %28 = tail call double @llvm.fma.f64(double %22, double %27, double 0x3F967E295F08B19F)
  %29 = tail call double @llvm.fma.f64(double %22, double %28, double 0xBF9E9AE6FC27006A)
  %30 = tail call double @llvm.fma.f64(double %22, double %29, double 0x3FA2C15B5711927A)
  %31 = tail call double @llvm.fma.f64(double %22, double %30, double 0xBFA59976E82D3FF0)
  %32 = tail call double @llvm.fma.f64(double %22, double %31, double 0x3FA82D5D6EF28734)
  %33 = tail call double @llvm.fma.f64(double %22, double %32, double 0xBFAAE5CE6A214619)
  %34 = tail call double @llvm.fma.f64(double %22, double %33, double 0x3FAE1BB48427B883)
  %35 = tail call double @llvm.fma.f64(double %22, double %34, double 0xBFB110E48B207F05)
  %36 = tail call double @llvm.fma.f64(double %22, double %35, double 0x3FB3B13657B87036)
  %37 = tail call double @llvm.fma.f64(double %22, double %36, double 0xBFB745D119378E4F)
  %38 = tail call double @llvm.fma.f64(double %22, double %37, double 0x3FBC71C717E1913C)
  %39 = tail call double @llvm.fma.f64(double %22, double %38, double 0xBFC2492492376B7D)
  %40 = tail call double @llvm.fma.f64(double %22, double %39, double 0x3FC99999999952CC)
  %41 = tail call double @llvm.fma.f64(double %22, double %40, double 0xBFD5555555555523)
  %42 = fmul double %22, %41
  %43 = tail call double @llvm.fma.f64(double %21, double %42, double %21)
  %44 = fneg double %43
  %45 = tail call double @llvm.fma.f64(double 0x3FEDD9AD336A0500, double 0x3FFAF154EEB562D6, double %44)
  %46 = select i1 %19, double %45, double %43
  %47 = tail call double @llvm.copysign.f64(double %46, double %17)
  %48 = getelementptr inbounds double, double addrspace(1)* %1, i64 %15
  store double %47, double addrspace(1)* %48, align 8, !tbaa !7
  br label %49

49:                                               ; preds = %14, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
