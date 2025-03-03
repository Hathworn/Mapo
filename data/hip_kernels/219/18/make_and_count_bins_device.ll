; ModuleID = '../data/hip_kernels/219/18/main.cu'
source_filename = "../data/hip_kernels/219/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z19make_and_count_binsPfPiS0_iiff(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4, float %5, float %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  %20 = tail call float @llvm.fabs.f32(float %19)
  %21 = icmp ult i32 %16, %4
  br i1 %21, label %22, label %41

22:                                               ; preds = %7
  %23 = fpext float %20 to double
  %24 = fpext float %6 to double
  %25 = fmul contract double %24, 1.000000e-02
  %26 = fcmp contract olt double %25, %23
  br i1 %26, label %27, label %36

27:                                               ; preds = %22
  %28 = fsub contract float %6, %20
  %29 = fmul contract float %28, %5
  %30 = tail call float @llvm.maxnum.f32(float %29, float 0.000000e+00)
  %31 = fptosi float %30 to i32
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %17
  store i32 %31, i32 addrspace(1)* %32, align 4, !tbaa !11
  %33 = sext i32 %31 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %33
  %35 = atomicrmw add i32 addrspace(1)* %34, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %41

36:                                               ; preds = %22
  %37 = fmul contract float %5, %6
  %38 = fadd contract float %37, 1.000000e+00
  %39 = fptosi float %38 to i32
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %17
  store i32 %39, i32 addrspace(1)* %40, align 4, !tbaa !11
  br label %41

41:                                               ; preds = %27, %36, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
