; ModuleID = '../data/hip_kernels/7801/79/main.cu'
source_filename = "../data/hip_kernels/7801/79/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_nextafterf(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = sext i32 %13 to i64
  %15 = icmp ult i64 %14, %0
  br i1 %15, label %16, label %53

16:                                               ; preds = %4
  %17 = getelementptr inbounds float, float addrspace(1)* %2, i64 %14
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !6
  %19 = getelementptr inbounds float, float addrspace(1)* %3, i64 %14
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = bitcast float %18 to i32
  %22 = sub nsw i32 -2147483648, %21
  %23 = icmp slt i32 %21, 0
  %24 = select i1 %23, i32 %22, i32 %21
  %25 = bitcast float %20 to i32
  %26 = sub nsw i32 -2147483648, %25
  %27 = icmp slt i32 %25, 0
  %28 = select i1 %27, i32 %26, i32 %25
  %29 = icmp sge i32 %24, %28
  %30 = select i1 %29, i32 -1, i32 1
  %31 = add nsw i32 %30, %24
  %32 = sub nsw i32 -2147483648, %31
  %33 = icmp slt i32 %31, 0
  %34 = select i1 %33, i32 %32, i32 %31
  %35 = icmp ne i32 %24, -1
  %36 = select i1 %35, i1 true, i1 %29
  %37 = select i1 %36, i32 %34, i32 -2147483648
  %38 = fcmp uno float %18, 0.000000e+00
  %39 = select i1 %38, i32 %21, i32 %37
  %40 = fcmp uno float %20, 0.000000e+00
  %41 = icmp eq i32 %21, %25
  %42 = tail call float @llvm.fabs.f32(float %18)
  %43 = bitcast float %42 to i32
  %44 = tail call float @llvm.fabs.f32(float %20)
  %45 = bitcast float %44 to i32
  %46 = or i32 %45, %43
  %47 = icmp eq i32 %46, 0
  %48 = select i1 %41, i1 true, i1 %47
  %49 = or i1 %40, %48
  %50 = select i1 %49, i32 %25, i32 %39
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %14
  %52 = bitcast float addrspace(1)* %51 to i32 addrspace(1)*
  store i32 %50, i32 addrspace(1)* %52, align 4, !tbaa !7
  br label %53

53:                                               ; preds = %16, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
