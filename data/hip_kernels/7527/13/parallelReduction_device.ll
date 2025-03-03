; ModuleID = '../data/hip_kernels/7527/13/main.cu'
source_filename = "../data/hip_kernels/7527/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_blockMemmory = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17parallelReductionPiiiiiS_(i32 addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %1
  br i1 %16, label %17, label %19

17:                                               ; preds = %6
  %18 = mul nsw i32 %4, %3
  br label %30

19:                                               ; preds = %30, %6
  %20 = phi i32 [ 0, %6 ], [ %36, %30 ]
  %21 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %14
  store i32 %20, i32 addrspace(3)* %21, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %22 = icmp eq i32 %14, 0
  br i1 %22, label %23, label %96

23:                                               ; preds = %19
  %24 = icmp sgt i32 %3, 0
  br i1 %24, label %25, label %54

25:                                               ; preds = %23
  %26 = and i32 %3, 7
  %27 = icmp ult i32 %3, 8
  br i1 %27, label %39, label %28

28:                                               ; preds = %25
  %29 = and i32 %3, -8
  br label %58

30:                                               ; preds = %17, %30
  %31 = phi i32 [ %15, %17 ], [ %37, %30 ]
  %32 = phi i32 [ 0, %17 ], [ %36, %30 ]
  %33 = sext i32 %31 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = add nsw i32 %35, %32
  %37 = add nsw i32 %31, %18
  %38 = icmp slt i32 %37, %1
  br i1 %38, label %30, label %19, !llvm.loop !11

39:                                               ; preds = %58, %25
  %40 = phi i32 [ undef, %25 ], [ %92, %58 ]
  %41 = phi i32 [ 0, %25 ], [ %93, %58 ]
  %42 = phi i32 [ 0, %25 ], [ %92, %58 ]
  %43 = icmp eq i32 %26, 0
  br i1 %43, label %54, label %44

44:                                               ; preds = %39, %44
  %45 = phi i32 [ %51, %44 ], [ %41, %39 ]
  %46 = phi i32 [ %50, %44 ], [ %42, %39 ]
  %47 = phi i32 [ %52, %44 ], [ 0, %39 ]
  %48 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %45
  %49 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !7
  %50 = add nsw i32 %49, %46
  %51 = add nuw nsw i32 %45, 1
  %52 = add i32 %47, 1
  %53 = icmp eq i32 %52, %26
  br i1 %53, label %54, label %44, !llvm.loop !13

54:                                               ; preds = %39, %44, %23
  %55 = phi i32 [ 0, %23 ], [ %40, %39 ], [ %50, %44 ]
  %56 = zext i32 %7 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %56
  store i32 %55, i32 addrspace(1)* %57, align 4, !tbaa !7
  br label %96

58:                                               ; preds = %58, %28
  %59 = phi i32 [ 0, %28 ], [ %93, %58 ]
  %60 = phi i32 [ 0, %28 ], [ %92, %58 ]
  %61 = phi i32 [ 0, %28 ], [ %94, %58 ]
  %62 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %59
  %63 = load i32, i32 addrspace(3)* %62, align 4, !tbaa !7
  %64 = add nsw i32 %63, %60
  %65 = or i32 %59, 1
  %66 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %65
  %67 = load i32, i32 addrspace(3)* %66, align 4, !tbaa !7
  %68 = add nsw i32 %67, %64
  %69 = or i32 %59, 2
  %70 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %69
  %71 = load i32, i32 addrspace(3)* %70, align 4, !tbaa !7
  %72 = add nsw i32 %71, %68
  %73 = or i32 %59, 3
  %74 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %73
  %75 = load i32, i32 addrspace(3)* %74, align 4, !tbaa !7
  %76 = add nsw i32 %75, %72
  %77 = or i32 %59, 4
  %78 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %77
  %79 = load i32, i32 addrspace(3)* %78, align 4, !tbaa !7
  %80 = add nsw i32 %79, %76
  %81 = or i32 %59, 5
  %82 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %81
  %83 = load i32, i32 addrspace(3)* %82, align 4, !tbaa !7
  %84 = add nsw i32 %83, %80
  %85 = or i32 %59, 6
  %86 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %85
  %87 = load i32, i32 addrspace(3)* %86, align 4, !tbaa !7
  %88 = add nsw i32 %87, %84
  %89 = or i32 %59, 7
  %90 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %89
  %91 = load i32, i32 addrspace(3)* %90, align 4, !tbaa !7
  %92 = add nsw i32 %91, %88
  %93 = add nuw nsw i32 %59, 8
  %94 = add i32 %61, 8
  %95 = icmp eq i32 %94, %29
  br i1 %95, label %39, label %58, !llvm.loop !15

96:                                               ; preds = %54, %19
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
