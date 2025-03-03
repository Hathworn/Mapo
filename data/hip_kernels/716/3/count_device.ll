; ModuleID = '../data/hip_kernels/716/3/main.cu'
source_filename = "../data/hip_kernels/716/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ5countPiS_iE5count = internal addrspace(3) global [8196 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z5countPiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %7 = bitcast i8 addrspace(4)* %6 to i32 addrspace(4)*
  %8 = load i32, i32 addrspace(4)* %7, align 4, !tbaa !4
  %9 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !13, !invariant.load !14
  %12 = zext i16 %11 to i32
  %13 = udiv i32 %8, %12
  %14 = mul i32 %13, %12
  %15 = icmp ugt i32 %8, %14
  %16 = zext i1 %15 to i32
  %17 = add i32 %13, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %19 = udiv i16 8196, %11
  %20 = zext i16 %19 to i32
  %21 = mul nuw nsw i32 %18, %20
  %22 = add nuw nsw i32 %21, %20
  %23 = icmp ult i32 %21, 8196
  br i1 %23, label %26, label %24

24:                                               ; preds = %26, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %25 = icmp sgt i32 %17, %2
  br i1 %25, label %35, label %33

26:                                               ; preds = %3, %26
  %27 = phi i32 [ %29, %26 ], [ %21, %3 ]
  %28 = getelementptr inbounds [8196 x i32], [8196 x i32] addrspace(3)* @_ZZ5countPiS_iE5count, i32 0, i32 %27
  store i32 0, i32 addrspace(3)* %28, align 4, !tbaa !16
  %29 = add nuw nsw i32 %27, 1
  %30 = icmp ult i32 %29, %22
  %31 = icmp ult i32 %27, 8195
  %32 = and i1 %30, %31
  br i1 %32, label %26, label %24, !llvm.loop !20

33:                                               ; preds = %24
  %34 = sdiv i32 %2, %17
  br label %35

35:                                               ; preds = %24, %33
  %36 = phi i32 [ %34, %33 ], [ 1, %24 ]
  %37 = mul nsw i32 %36, %4
  %38 = icmp slt i32 %36, %12
  br i1 %38, label %41, label %39

39:                                               ; preds = %35
  %40 = sdiv i32 %36, %12
  br label %41

41:                                               ; preds = %35, %39
  %42 = phi i32 [ %40, %39 ], [ 1, %35 ]
  %43 = mul nsw i32 %42, %18
  %44 = add nsw i32 %43, %37
  %45 = add nsw i32 %44, %42
  %46 = add nsw i32 %37, %36
  %47 = icmp sgt i32 %42, 0
  %48 = icmp slt i32 %43, %36
  %49 = select i1 %47, i1 %48, i1 false
  %50 = icmp slt i32 %44, %2
  %51 = select i1 %49, i1 %50, i1 false
  br i1 %51, label %58, label %52

52:                                               ; preds = %58, %41
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %53 = mul nsw i32 %4, 8196
  %54 = add nsw i32 %21, %53
  %55 = add nsw i32 %54, %20
  %56 = add i32 %53, 8196
  %57 = icmp sgt i32 %55, %56
  br i1 %57, label %97, label %71

58:                                               ; preds = %41, %58
  %59 = phi i32 [ %65, %58 ], [ %44, %41 ]
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !16, !amdgpu.noclobber !14
  %63 = getelementptr inbounds [8196 x i32], [8196 x i32] addrspace(3)* @_ZZ5countPiS_iE5count, i32 0, i32 %62
  %64 = atomicrmw add i32 addrspace(3)* %63, i32 1 syncscope("agent-one-as") monotonic, align 4
  %65 = add nsw i32 %59, 1
  %66 = icmp slt i32 %65, %45
  %67 = icmp slt i32 %65, %46
  %68 = select i1 %66, i1 %67, i1 false
  %69 = icmp slt i32 %65, %2
  %70 = select i1 %68, i1 %69, i1 false
  br i1 %70, label %58, label %52, !llvm.loop !22

71:                                               ; preds = %52
  %72 = sext i32 %54 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %72
  %74 = bitcast i32 addrspace(1)* %73 to i8 addrspace(1)*
  %75 = getelementptr inbounds [8196 x i32], [8196 x i32] addrspace(3)* @_ZZ5countPiS_iE5count, i32 0, i32 %21
  %76 = bitcast i32 addrspace(3)* %75 to i8 addrspace(3)*
  %77 = shl nuw i16 %19, 2
  %78 = zext i16 %77 to i64
  br label %79

79:                                               ; preds = %71, %79
  %80 = phi i8 addrspace(3)* [ %94, %79 ], [ %76, %71 ]
  %81 = phi i8 addrspace(1)* [ %95, %79 ], [ %74, %71 ]
  %82 = phi i64 [ %93, %79 ], [ %78, %71 ]
  %83 = load i8, i8 addrspace(3)* %80, align 1, !tbaa !23
  store i8 %83, i8 addrspace(1)* %81, align 1, !tbaa !23
  %84 = getelementptr inbounds i8, i8 addrspace(3)* %80, i32 1
  %85 = load i8, i8 addrspace(3)* %84, align 1, !tbaa !23
  %86 = getelementptr inbounds i8, i8 addrspace(1)* %81, i64 1
  store i8 %85, i8 addrspace(1)* %86, align 1, !tbaa !23
  %87 = getelementptr inbounds i8, i8 addrspace(3)* %80, i32 2
  %88 = load i8, i8 addrspace(3)* %87, align 1, !tbaa !23
  %89 = getelementptr inbounds i8, i8 addrspace(1)* %81, i64 2
  store i8 %88, i8 addrspace(1)* %89, align 1, !tbaa !23
  %90 = getelementptr inbounds i8, i8 addrspace(3)* %80, i32 3
  %91 = load i8, i8 addrspace(3)* %90, align 1, !tbaa !23
  %92 = getelementptr inbounds i8, i8 addrspace(1)* %81, i64 3
  store i8 %91, i8 addrspace(1)* %92, align 1, !tbaa !23
  %93 = add nsw i64 %82, -4
  %94 = getelementptr inbounds i8, i8 addrspace(3)* %80, i32 4
  %95 = getelementptr inbounds i8, i8 addrspace(1)* %81, i64 4
  %96 = icmp eq i64 %93, 0
  br i1 %96, label %97, label %79, !llvm.loop !24

97:                                               ; preds = %79, %52
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = !{!18, !18, i64 0}
!24 = distinct !{!24, !21}
