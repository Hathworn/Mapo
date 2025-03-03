; ModuleID = '../data/hip_kernels/922/8/main.cu'
source_filename = "../data/hip_kernels/922/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20root_pointer_jumpingPiS_iPbE10block_flag = internal unnamed_addr addrspace(3) global i8 undef, align 1

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z20root_pointer_jumpingPiS_iPb(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture %1, i32 %2, i8 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %5, %11
  %13 = add i32 %12, %6
  %14 = icmp ne i32 %6, 0
  br i1 %14, label %16, label %15

15:                                               ; preds = %4
  store i8 0, i8 addrspace(3)* @_ZZ20root_pointer_jumpingPiS_iPbE10block_flag, align 1, !tbaa !7
  br label %16

16:                                               ; preds = %15, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %17 = icmp slt i32 %13, %2
  br i1 %17, label %18, label %32

18:                                               ; preds = %16
  %19 = sext i32 %13 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !11, !amdgpu.noclobber !6
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %32

23:                                               ; preds = %18
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %19
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !11, !amdgpu.noclobber !6
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !11, !amdgpu.noclobber !6
  %29 = icmp eq i32 %25, %28
  br i1 %29, label %31, label %30

30:                                               ; preds = %23
  store i32 %28, i32 addrspace(1)* %24, align 4, !tbaa !11
  store i8 1, i8 addrspace(3)* @_ZZ20root_pointer_jumpingPiS_iPbE10block_flag, align 1, !tbaa !7
  br label %32

31:                                               ; preds = %23
  store i32 -1, i32 addrspace(1)* %20, align 4, !tbaa !11
  br label %32

32:                                               ; preds = %18, %31, %30, %16
  %33 = load i8, i8 addrspace(3)* @_ZZ20root_pointer_jumpingPiS_iPbE10block_flag, align 1
  %34 = icmp eq i8 %33, 0
  %35 = select i1 %14, i1 true, i1 %34
  br i1 %35, label %37, label %36

36:                                               ; preds = %32
  store i8 1, i8 addrspace(1)* %3, align 1, !tbaa !7
  br label %37

37:                                               ; preds = %36, %32
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
!8 = !{!"bool", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
