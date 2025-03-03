; ModuleID = '../data/hip_kernels/13236/1/main.cu'
source_filename = "../data/hip_kernels/13236/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z21imperviousness_changePKhS0_jjPi(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = zext i32 %6 to i64
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = zext i16 %11 to i64
  %14 = zext i32 %12 to i64
  %15 = mul nuw nsw i64 %13, %14
  %16 = add nuw nsw i64 %15, %7
  %17 = mul i32 %3, %2
  %18 = zext i32 %17 to i64
  %19 = icmp ult i64 %16, %18
  br i1 %19, label %20, label %29

20:                                               ; preds = %5
  %21 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %16
  %22 = load i8, i8 addrspace(1)* %21, align 1, !tbaa !7, !amdgpu.noclobber !6
  %23 = zext i8 %22 to i32
  %24 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %16
  %25 = load i8, i8 addrspace(1)* %24, align 1, !tbaa !7, !amdgpu.noclobber !6
  %26 = zext i8 %25 to i32
  %27 = sub nsw i32 %23, %26
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %16
  store i32 %27, i32 addrspace(1)* %28, align 4, !tbaa !10
  br label %29

29:                                               ; preds = %20, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
