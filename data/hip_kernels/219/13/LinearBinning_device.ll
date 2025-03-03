; ModuleID = '../data/hip_kernels/219/13/main.cu'
source_filename = "../data/hip_kernels/219/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z13LinearBinningPfPiS0_iiiff(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, float %6, float %7) local_unnamed_addr #0 {
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %13
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = tail call float @llvm.fabs.f32(float %20)
  %22 = icmp ult i32 %17, %5
  br i1 %22, label %23, label %44

23:                                               ; preds = %8
  %24 = fpext float %21 to double
  %25 = fpext float %7 to double
  %26 = fmul contract double %25, 0x3EB0C6F7A0B5ED8D
  %27 = fcmp contract olt double %26, %24
  br i1 %27, label %28, label %39

28:                                               ; preds = %23
  %29 = fsub contract float %7, %21
  %30 = fmul contract float %29, %6
  %31 = tail call float @llvm.maxnum.f32(float %30, float 0.000000e+00)
  %32 = fptosi float %31 to i32
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %18
  store i32 %32, i32 addrspace(1)* %33, align 4, !tbaa !11
  %34 = icmp slt i32 %32, %4
  br i1 %34, label %35, label %44

35:                                               ; preds = %28
  %36 = sext i32 %32 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %36
  %38 = atomicrmw add i32 addrspace(1)* %37, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %44

39:                                               ; preds = %23
  %40 = fmul contract float %6, %7
  %41 = fadd contract float %40, 1.000000e+00
  %42 = fptosi float %41 to i32
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %18
  store i32 %42, i32 addrspace(1)* %43, align 4, !tbaa !11
  br label %44

44:                                               ; preds = %39, %35, %28, %8
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
