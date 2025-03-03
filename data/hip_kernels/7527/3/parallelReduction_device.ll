; ModuleID = '../data/hip_kernels/7527/3/main.cu'
source_filename = "../data/hip_kernels/7527/3/main.cu"
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
  %16 = mul nsw i32 %15, %2
  %17 = icmp sgt i32 %16, %1
  br i1 %17, label %98, label %18

18:                                               ; preds = %6
  %19 = add nsw i32 %16, %2
  %20 = icmp sgt i32 %2, 0
  br i1 %20, label %32, label %21

21:                                               ; preds = %32, %18
  %22 = phi i32 [ 0, %18 ], [ %38, %32 ]
  %23 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %14
  store i32 %22, i32 addrspace(3)* %23, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %24 = icmp eq i32 %14, 0
  br i1 %24, label %25, label %98

25:                                               ; preds = %21
  %26 = icmp sgt i32 %3, 0
  br i1 %26, label %27, label %56

27:                                               ; preds = %25
  %28 = and i32 %3, 7
  %29 = icmp ult i32 %3, 8
  br i1 %29, label %41, label %30

30:                                               ; preds = %27
  %31 = and i32 %3, -8
  br label %60

32:                                               ; preds = %18, %32
  %33 = phi i32 [ %39, %32 ], [ %16, %18 ]
  %34 = phi i32 [ %38, %32 ], [ 0, %18 ]
  %35 = sext i32 %33 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = add nsw i32 %37, %34
  %39 = add nsw i32 %33, 1
  %40 = icmp slt i32 %39, %19
  br i1 %40, label %32, label %21, !llvm.loop !11

41:                                               ; preds = %60, %27
  %42 = phi i32 [ undef, %27 ], [ %94, %60 ]
  %43 = phi i32 [ 0, %27 ], [ %95, %60 ]
  %44 = phi i32 [ 0, %27 ], [ %94, %60 ]
  %45 = icmp eq i32 %28, 0
  br i1 %45, label %56, label %46

46:                                               ; preds = %41, %46
  %47 = phi i32 [ %53, %46 ], [ %43, %41 ]
  %48 = phi i32 [ %52, %46 ], [ %44, %41 ]
  %49 = phi i32 [ %54, %46 ], [ 0, %41 ]
  %50 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %47
  %51 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %52 = add nsw i32 %51, %48
  %53 = add nuw nsw i32 %47, 1
  %54 = add i32 %49, 1
  %55 = icmp eq i32 %54, %28
  br i1 %55, label %56, label %46, !llvm.loop !13

56:                                               ; preds = %41, %46, %25
  %57 = phi i32 [ 0, %25 ], [ %42, %41 ], [ %52, %46 ]
  %58 = zext i32 %7 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %58
  store i32 %57, i32 addrspace(1)* %59, align 4, !tbaa !7
  br label %98

60:                                               ; preds = %60, %30
  %61 = phi i32 [ 0, %30 ], [ %95, %60 ]
  %62 = phi i32 [ 0, %30 ], [ %94, %60 ]
  %63 = phi i32 [ 0, %30 ], [ %96, %60 ]
  %64 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %61
  %65 = load i32, i32 addrspace(3)* %64, align 4, !tbaa !7
  %66 = add nsw i32 %65, %62
  %67 = or i32 %61, 1
  %68 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %67
  %69 = load i32, i32 addrspace(3)* %68, align 4, !tbaa !7
  %70 = add nsw i32 %69, %66
  %71 = or i32 %61, 2
  %72 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %71
  %73 = load i32, i32 addrspace(3)* %72, align 4, !tbaa !7
  %74 = add nsw i32 %73, %70
  %75 = or i32 %61, 3
  %76 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %75
  %77 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !7
  %78 = add nsw i32 %77, %74
  %79 = or i32 %61, 4
  %80 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %79
  %81 = load i32, i32 addrspace(3)* %80, align 4, !tbaa !7
  %82 = add nsw i32 %81, %78
  %83 = or i32 %61, 5
  %84 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %83
  %85 = load i32, i32 addrspace(3)* %84, align 4, !tbaa !7
  %86 = add nsw i32 %85, %82
  %87 = or i32 %61, 6
  %88 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %87
  %89 = load i32, i32 addrspace(3)* %88, align 4, !tbaa !7
  %90 = add nsw i32 %89, %86
  %91 = or i32 %61, 7
  %92 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @d_blockMemmory, i32 0, i32 %91
  %93 = load i32, i32 addrspace(3)* %92, align 4, !tbaa !7
  %94 = add nsw i32 %93, %90
  %95 = add nuw nsw i32 %61, 8
  %96 = add i32 %63, 8
  %97 = icmp eq i32 %96, %31
  br i1 %97, label %41, label %60, !llvm.loop !15

98:                                               ; preds = %21, %56, %6
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
