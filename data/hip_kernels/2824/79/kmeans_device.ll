; ModuleID = '../data/hip_kernels/2824/79/main.cu'
source_filename = "../data/hip_kernels/2824/79/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z6kmeansPsS_PiS0_i(i16 addrspace(1)* nocapture readonly %0, i16 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = shl i32 %14, 1
  %16 = icmp slt i32 %15, %4
  br i1 %16, label %17, label %56

17:                                               ; preds = %5
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %18
  %20 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 2
  %21 = load i16, i16 addrspace(1)* %20, align 2, !tbaa !7, !amdgpu.noclobber !5
  %22 = sext i16 %21 to i32
  %23 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 3
  %24 = load i16, i16 addrspace(1)* %23, align 2, !tbaa !7, !amdgpu.noclobber !5
  %25 = sext i16 %24 to i32
  %26 = bitcast i16 addrspace(1)* %19 to <2 x i16> addrspace(1)*
  %27 = load <2 x i16>, <2 x i16> addrspace(1)* %26, align 2, !tbaa !7
  %28 = sext <2 x i16> %27 to <2 x i32>
  %29 = bitcast i16 addrspace(1)* %1 to <2 x i16> addrspace(1)*
  %30 = load <2 x i16>, <2 x i16> addrspace(1)* %29, align 2, !tbaa !7
  %31 = sext <2 x i16> %30 to <2 x i32>
  %32 = sub nsw <2 x i32> %28, %31
  %33 = extractelement <2 x i32> %28, i64 0
  %34 = sub nsw i32 %33, %22
  %35 = extractelement <2 x i32> %28, i64 1
  %36 = sub nsw i32 %35, %25
  %37 = mul nsw <2 x i32> %32, %32
  %38 = mul nsw i32 %34, %34
  %39 = mul nsw i32 %36, %36
  %40 = extractelement <2 x i32> %37, i64 0
  %41 = extractelement <2 x i32> %37, i64 1
  %42 = add nuw nsw i32 %41, %40
  %43 = add nuw nsw i32 %39, %38
  %44 = icmp uge i32 %42, %43
  %45 = select i1 %44, i32 2, i32 0
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %46
  %48 = atomicrmw add i32 addrspace(1)* %47, i32 %33 syncscope("agent-one-as") monotonic, align 4
  %49 = or i32 %45, 1
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %50
  %52 = atomicrmw add i32 addrspace(1)* %51, i32 %35 syncscope("agent-one-as") monotonic, align 4
  %53 = zext i1 %44 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %53
  %55 = atomicrmw add i32 addrspace(1)* %54, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %56

56:                                               ; preds = %17, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
