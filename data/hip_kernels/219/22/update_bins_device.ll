; ModuleID = '../data/hip_kernels/219/22/main.cu'
source_filename = "../data/hip_kernels/219/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z11update_binsPfPiS0_iiff(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4, float %5, float %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp ult i32 %16, %4
  br i1 %17, label %18, label %48

18:                                               ; preds = %7
  %19 = zext i32 %16 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = tail call float @llvm.fabs.f32(float %21)
  %23 = fpext float %22 to double
  %24 = fpext float %6 to double
  %25 = fmul contract double %24, 0x3EB0C6F7A0B5ED8D
  %26 = fcmp contract olt double %25, %23
  %27 = fsub contract float %6, %22
  %28 = fmul contract float %27, %5
  %29 = fptosi float %28 to i32
  %30 = select i1 %26, i32 %29, i32 %3
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %19
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !11, !amdgpu.noclobber !5
  %33 = icmp eq i32 %32, %30
  br i1 %33, label %48, label %34

34:                                               ; preds = %18
  %35 = icmp slt i32 %32, %3
  br i1 %35, label %36, label %40

36:                                               ; preds = %34
  %37 = sext i32 %32 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %37
  %39 = atomicrmw add i32 addrspace(1)* %38, i32 -1 syncscope("agent-one-as") monotonic, align 4
  br label %40

40:                                               ; preds = %36, %34
  %41 = icmp slt i32 %30, %3
  br i1 %41, label %42, label %47

42:                                               ; preds = %40
  %43 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !11
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %44
  %46 = atomicrmw add i32 addrspace(1)* %45, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %47

47:                                               ; preds = %42, %40
  store i32 %30, i32 addrspace(1)* %31, align 4, !tbaa !11
  br label %48

48:                                               ; preds = %18, %47, %7
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
