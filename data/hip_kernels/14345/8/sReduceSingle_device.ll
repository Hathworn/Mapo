; ModuleID = '../data/hip_kernels/14345/8/main.cu'
source_filename = "../data/hip_kernels/14345/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13sReduceSinglePiS_j(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = add nuw nsw i32 %4, %9
  %11 = udiv i32 %2, %9
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %89

13:                                               ; preds = %3
  %14 = and i32 %11, 7
  %15 = icmp ult i32 %11, 8
  br i1 %15, label %72, label %16

16:                                               ; preds = %13
  %17 = and i32 %11, -8
  br label %18

18:                                               ; preds = %18, %16
  %19 = phi i32 [ 0, %16 ], [ %68, %18 ]
  %20 = phi i32 [ 0, %16 ], [ %69, %18 ]
  %21 = phi i32 [ 0, %16 ], [ %70, %18 ]
  %22 = add nuw i32 %10, %20
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %23
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !6
  %26 = add nsw i32 %25, %19
  %27 = or i32 %20, 1
  %28 = add nuw i32 %10, %27
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = add nsw i32 %31, %26
  %33 = or i32 %20, 2
  %34 = add nuw i32 %10, %33
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !6
  %38 = add nsw i32 %37, %32
  %39 = or i32 %20, 3
  %40 = add nuw i32 %10, %39
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %44 = add nsw i32 %43, %38
  %45 = or i32 %20, 4
  %46 = add nuw i32 %10, %45
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = add nsw i32 %49, %44
  %51 = or i32 %20, 5
  %52 = add nuw i32 %10, %51
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !6
  %56 = add nsw i32 %55, %50
  %57 = or i32 %20, 6
  %58 = add nuw i32 %10, %57
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !6
  %62 = add nsw i32 %61, %56
  %63 = or i32 %20, 7
  %64 = add nuw i32 %10, %63
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !6
  %68 = add nsw i32 %67, %62
  %69 = add nuw nsw i32 %20, 8
  %70 = add i32 %21, 8
  %71 = icmp eq i32 %70, %17
  br i1 %71, label %72, label %18, !llvm.loop !11

72:                                               ; preds = %18, %13
  %73 = phi i32 [ undef, %13 ], [ %68, %18 ]
  %74 = phi i32 [ 0, %13 ], [ %68, %18 ]
  %75 = phi i32 [ 0, %13 ], [ %69, %18 ]
  %76 = icmp eq i32 %14, 0
  br i1 %76, label %89, label %77

77:                                               ; preds = %72, %77
  %78 = phi i32 [ %85, %77 ], [ %74, %72 ]
  %79 = phi i32 [ %86, %77 ], [ %75, %72 ]
  %80 = phi i32 [ %87, %77 ], [ 0, %72 ]
  %81 = add nuw i32 %10, %79
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !6
  %85 = add nsw i32 %84, %78
  %86 = add nuw nsw i32 %79, 1
  %87 = add i32 %80, 1
  %88 = icmp eq i32 %87, %14
  br i1 %88, label %89, label %77, !llvm.loop !13

89:                                               ; preds = %72, %77, %3
  %90 = phi i32 [ 0, %3 ], [ %73, %72 ], [ %85, %77 ]
  %91 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %4
  store i32 %90, i32 addrspace(3)* %91, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %92 = icmp ult i16 %8, 2
  br i1 %92, label %105, label %93

93:                                               ; preds = %89, %103
  %94 = phi i32 [ %95, %103 ], [ %9, %89 ]
  %95 = lshr i32 %94, 1
  %96 = icmp ult i32 %4, %95
  br i1 %96, label %97, label %103

97:                                               ; preds = %93
  %98 = add nuw nsw i32 %95, %4
  %99 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 %98
  %100 = load i32, i32 addrspace(3)* %99, align 4, !tbaa !7
  %101 = load i32, i32 addrspace(3)* %91, align 4, !tbaa !7
  %102 = add nsw i32 %101, %100
  store i32 %102, i32 addrspace(3)* %91, align 4, !tbaa !7
  br label %103

103:                                              ; preds = %97, %93
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %104 = icmp ult i32 %94, 4
  br i1 %104, label %105, label %93, !llvm.loop !15

105:                                              ; preds = %103, %89
  %106 = icmp eq i32 %4, 0
  br i1 %106, label %107, label %109

107:                                              ; preds = %105
  %108 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !7
  store i32 %108, i32 addrspace(1)* %1, align 4, !tbaa !7
  br label %109

109:                                              ; preds = %107, %105
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
