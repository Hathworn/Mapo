; ModuleID = '../data/hip_kernels/922/10/main.cu'
source_filename = "../data/hip_kernels/922/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.Edge = type { i64 }

@_ZZ19process_cross_edgesPiP4EdgeiPbS2_E10block_flag = internal unnamed_addr addrspace(3) global i8 undef, align 1

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z19process_cross_edgesPiP4EdgeiPbS2_(i32 addrspace(1)* nocapture %0, %struct.Edge addrspace(1)* nocapture readonly %1, i32 %2, i8 addrspace(1)* nocapture writeonly %3, i8 addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %6, %12
  %14 = add i32 %13, %7
  %15 = icmp ne i32 %7, 0
  br i1 %15, label %17, label %16

16:                                               ; preds = %5
  store i8 0, i8 addrspace(3)* @_ZZ19process_cross_edgesPiP4EdgeiPbS2_E10block_flag, align 1, !tbaa !7
  br label %17

17:                                               ; preds = %16, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = icmp slt i32 %14, %2
  br i1 %18, label %19, label %41

19:                                               ; preds = %17
  %20 = sext i32 %14 to i64
  %21 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %20
  %22 = load i8, i8 addrspace(1)* %21, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !6
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %41, label %24

24:                                               ; preds = %19
  %25 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 %20, i32 0
  %26 = load i64, i64 addrspace(1)* %25, align 8, !tbaa !12, !amdgpu.noclobber !6
  %27 = ashr i64 %26, 32
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !15, !amdgpu.noclobber !6
  %30 = shl i64 %26, 32
  %31 = ashr exact i64 %30, 32
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !15, !amdgpu.noclobber !6
  %34 = icmp eq i32 %29, %33
  br i1 %34, label %35, label %36

35:                                               ; preds = %24
  store i8 0, i8 addrspace(1)* %21, align 1, !tbaa !7
  br label %41

36:                                               ; preds = %24
  %37 = tail call i32 @llvm.smin.i32(i32 %29, i32 %33)
  %38 = tail call i32 @llvm.smax.i32(i32 %29, i32 %33)
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  store i32 %37, i32 addrspace(1)* %40, align 4, !tbaa !15
  store i8 1, i8 addrspace(3)* @_ZZ19process_cross_edgesPiP4EdgeiPbS2_E10block_flag, align 1, !tbaa !7
  br label %41

41:                                               ; preds = %19, %36, %35, %17
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = load i8, i8 addrspace(3)* @_ZZ19process_cross_edgesPiP4EdgeiPbS2_E10block_flag, align 1
  %43 = icmp eq i8 %42, 0
  %44 = select i1 %15, i1 true, i1 %43
  br i1 %44, label %46, label %45

45:                                               ; preds = %41
  store i8 1, i8 addrspace(1)* %3, align 1, !tbaa !7
  br label %46

46:                                               ; preds = %45, %41
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
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
!8 = !{!"bool", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i8 0, i8 2}
!12 = !{!13, !14, i64 0}
!13 = !{!"_ZTS4Edge", !14, i64 0}
!14 = !{!"long long", !9, i64 0}
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !9, i64 0}
