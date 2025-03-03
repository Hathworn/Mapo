; ModuleID = '../data/hip_kernels/937/1/main.cu'
source_filename = "../data/hip_kernels/937/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15yuv2rgb_gpu_sonPhS_S_S_S_S_i(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture writeonly %3, i8 addrspace(1)* nocapture writeonly %4, i8 addrspace(1)* nocapture writeonly %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %13
  %16 = add i32 %15, %8
  %17 = icmp slt i32 %16, %6
  br i1 %17, label %18, label %56

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %19
  %21 = load i8, i8 addrspace(1)* %20, align 1, !tbaa !7, !amdgpu.noclobber !6
  %22 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %19
  %23 = load i8, i8 addrspace(1)* %22, align 1, !tbaa !7, !amdgpu.noclobber !6
  %24 = zext i8 %23 to i32
  %25 = add nsw i32 %24, -128
  %26 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %19
  %27 = load i8, i8 addrspace(1)* %26, align 1, !tbaa !7, !amdgpu.noclobber !6
  %28 = zext i8 %27 to i32
  %29 = add nsw i32 %28, -128
  %30 = uitofp i8 %21 to double
  %31 = sitofp i32 %29 to double
  %32 = fmul contract double %31, 1.402000e+00
  %33 = fadd contract double %32, %30
  %34 = fptosi double %33 to i32
  %35 = sitofp i32 %25 to double
  %36 = fmul contract double %35, 3.440000e-01
  %37 = fsub contract double %30, %36
  %38 = fmul contract double %31, 7.140000e-01
  %39 = fsub contract double %37, %38
  %40 = fptosi double %39 to i32
  %41 = fmul contract double %35, 1.772000e+00
  %42 = fadd contract double %41, %30
  %43 = fptosi double %42 to i32
  %44 = tail call i32 @llvm.smax.i32(i32 %34, i32 0)
  %45 = tail call i32 @llvm.umin.i32(i32 %44, i32 255)
  %46 = trunc i32 %45 to i8
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %19
  store i8 %46, i8 addrspace(1)* %47, align 1, !tbaa !7
  %48 = tail call i32 @llvm.smax.i32(i32 %40, i32 0)
  %49 = tail call i32 @llvm.umin.i32(i32 %48, i32 255)
  %50 = trunc i32 %49 to i8
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %19
  store i8 %50, i8 addrspace(1)* %51, align 1, !tbaa !7
  %52 = tail call i32 @llvm.smax.i32(i32 %43, i32 0)
  %53 = tail call i32 @llvm.umin.i32(i32 %52, i32 255)
  %54 = trunc i32 %53 to i8
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %19
  store i8 %54, i8 addrspace(1)* %55, align 1, !tbaa !7
  br label %56

56:                                               ; preds = %7, %18
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
