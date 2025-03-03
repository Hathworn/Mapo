; ModuleID = '../data/hip_kernels/640/6/main.cu'
source_filename = "../data/hip_kernels/640/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@pre_sort_blk_data = external hidden addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8pre_sortPjS_S_S_jjjjS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 addrspace(1)* nocapture readnone %8) local_unnamed_addr #0 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %14
  %17 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @pre_sort_blk_data, i32 0, i32 %14
  %18 = shl nuw nsw i32 %14, 1
  %19 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @pre_sort_blk_data, i32 0, i32 %18
  %20 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @pre_sort_blk_data, i32 0, i32 %5
  %21 = getelementptr inbounds i32, i32 addrspace(3)* %20, i32 %18
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %16, %22
  %24 = icmp ult i32 %23, %4
  br i1 %24, label %25, label %33

25:                                               ; preds = %9
  %26 = sext i32 %23 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %29 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @pre_sort_blk_data, i32 0, i32 %22
  store i32 %28, i32 addrspace(3)* %29, align 4, !tbaa !7
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %26
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = getelementptr inbounds i32, i32 addrspace(3)* %17, i32 %22
  store i32 %31, i32 addrspace(3)* %32, align 4, !tbaa !7
  br label %33

33:                                               ; preds = %25, %9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = icmp ult i32 %22, %5
  br i1 %34, label %45, label %35

35:                                               ; preds = %45, %33
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @pre_sort_blk_data, i32 0, i32 %22
  %37 = load i32, i32 addrspace(3)* %36, align 4, !tbaa !7
  %38 = lshr i32 %37, %7
  %39 = and i32 %38, %6
  %40 = getelementptr inbounds i32, i32 addrspace(3)* %19, i32 %39
  %41 = atomicrmw add i32 addrspace(3)* %40, i32 1 syncscope("agent-one-as") monotonic, align 4
  %42 = getelementptr inbounds i32, i32 addrspace(3)* %21, i32 %39
  %43 = atomicrmw add i32 addrspace(3)* %42, i32 1 syncscope("agent-one-as") monotonic, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = icmp ugt i32 %5, 1
  br i1 %44, label %51, label %54

45:                                               ; preds = %33, %45
  %46 = phi i32 [ %49, %45 ], [ %22, %33 ]
  %47 = getelementptr inbounds i32, i32 addrspace(3)* %19, i32 %46
  store i32 0, i32 addrspace(3)* %47, align 4, !tbaa !7
  %48 = getelementptr inbounds i32, i32 addrspace(3)* %21, i32 %46
  store i32 0, i32 addrspace(3)* %48, align 4, !tbaa !7
  %49 = add i32 %46, %14
  %50 = icmp ult i32 %49, %5
  br i1 %50, label %45, label %35, !llvm.loop !11

51:                                               ; preds = %35, %55
  %52 = phi i32 [ %56, %55 ], [ undef, %35 ]
  %53 = phi i32 [ %57, %55 ], [ 1, %35 ]
  br i1 %34, label %59, label %55

54:                                               ; preds = %55, %35
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %34, label %83, label %76

55:                                               ; preds = %73, %51
  %56 = phi i32 [ %52, %51 ], [ %68, %73 ]
  %57 = shl nsw i32 %53, 1
  %58 = icmp ult i32 %57, %5
  br i1 %58, label %51, label %54, !llvm.loop !13

59:                                               ; preds = %51, %73
  %60 = phi i32 [ %68, %73 ], [ %52, %51 ]
  %61 = phi i32 [ %74, %73 ], [ %22, %51 ]
  %62 = icmp slt i32 %61, %53
  br i1 %62, label %67, label %63

63:                                               ; preds = %59
  %64 = sub nsw i32 %61, %53
  %65 = getelementptr inbounds i32, i32 addrspace(3)* %21, i32 %64
  %66 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !7
  br label %67

67:                                               ; preds = %63, %59
  %68 = phi i32 [ %66, %63 ], [ %60, %59 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %62, label %73, label %69

69:                                               ; preds = %67
  %70 = getelementptr inbounds i32, i32 addrspace(3)* %21, i32 %61
  %71 = load i32, i32 addrspace(3)* %70, align 4, !tbaa !7
  %72 = add i32 %71, %68
  store i32 %72, i32 addrspace(3)* %70, align 4, !tbaa !7
  br label %73

73:                                               ; preds = %69, %67
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %74 = add i32 %61, %14
  %75 = icmp ult i32 %74, %5
  br i1 %75, label %59, label %55, !llvm.loop !14

76:                                               ; preds = %83, %54
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %77 = icmp eq i32 %22, 0
  br i1 %77, label %78, label %175

78:                                               ; preds = %76
  %79 = and i32 %14, 3
  %80 = icmp ult i16 %13, 4
  br i1 %80, label %153, label %81

81:                                               ; preds = %78
  %82 = and i32 %14, 2044
  br label %92

83:                                               ; preds = %54, %83
  %84 = phi i32 [ %90, %83 ], [ %22, %54 ]
  %85 = getelementptr inbounds i32, i32 addrspace(3)* %19, i32 %84
  %86 = load i32, i32 addrspace(3)* %85, align 4, !tbaa !7
  %87 = getelementptr inbounds i32, i32 addrspace(3)* %21, i32 %84
  %88 = load i32, i32 addrspace(3)* %87, align 4, !tbaa !7
  %89 = sub i32 %88, %86
  store i32 %89, i32 addrspace(3)* %87, align 4, !tbaa !7
  %90 = add i32 %84, %14
  %91 = icmp ult i32 %90, %5
  br i1 %91, label %83, label %76, !llvm.loop !15

92:                                               ; preds = %92, %81
  %93 = phi i32 [ 0, %81 ], [ %150, %92 ]
  %94 = phi i32 [ 0, %81 ], [ %151, %92 ]
  %95 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @pre_sort_blk_data, i32 0, i32 %93
  %96 = load i32, i32 addrspace(3)* %95, align 4, !tbaa !7
  %97 = lshr i32 %96, %7
  %98 = and i32 %97, %6
  %99 = getelementptr inbounds i32, i32 addrspace(3)* %21, i32 %98
  %100 = load i32, i32 addrspace(3)* %99, align 4, !tbaa !7
  %101 = add i32 %100, %16
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %102
  store i32 %96, i32 addrspace(1)* %103, align 4, !tbaa !7
  %104 = getelementptr inbounds i32, i32 addrspace(3)* %17, i32 %93
  %105 = load i32, i32 addrspace(3)* %104, align 4, !tbaa !7
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %102
  store i32 %105, i32 addrspace(1)* %106, align 4, !tbaa !7
  %107 = add i32 %100, 1
  store i32 %107, i32 addrspace(3)* %99, align 4, !tbaa !7
  %108 = or i32 %93, 1
  %109 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @pre_sort_blk_data, i32 0, i32 %108
  %110 = load i32, i32 addrspace(3)* %109, align 4, !tbaa !7
  %111 = lshr i32 %110, %7
  %112 = and i32 %111, %6
  %113 = getelementptr inbounds i32, i32 addrspace(3)* %21, i32 %112
  %114 = load i32, i32 addrspace(3)* %113, align 4, !tbaa !7
  %115 = add i32 %114, %16
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %116
  store i32 %110, i32 addrspace(1)* %117, align 4, !tbaa !7
  %118 = getelementptr inbounds i32, i32 addrspace(3)* %17, i32 %108
  %119 = load i32, i32 addrspace(3)* %118, align 4, !tbaa !7
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %116
  store i32 %119, i32 addrspace(1)* %120, align 4, !tbaa !7
  %121 = add i32 %114, 1
  store i32 %121, i32 addrspace(3)* %113, align 4, !tbaa !7
  %122 = or i32 %93, 2
  %123 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @pre_sort_blk_data, i32 0, i32 %122
  %124 = load i32, i32 addrspace(3)* %123, align 4, !tbaa !7
  %125 = lshr i32 %124, %7
  %126 = and i32 %125, %6
  %127 = getelementptr inbounds i32, i32 addrspace(3)* %21, i32 %126
  %128 = load i32, i32 addrspace(3)* %127, align 4, !tbaa !7
  %129 = add i32 %128, %16
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %130
  store i32 %124, i32 addrspace(1)* %131, align 4, !tbaa !7
  %132 = getelementptr inbounds i32, i32 addrspace(3)* %17, i32 %122
  %133 = load i32, i32 addrspace(3)* %132, align 4, !tbaa !7
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %130
  store i32 %133, i32 addrspace(1)* %134, align 4, !tbaa !7
  %135 = add i32 %128, 1
  store i32 %135, i32 addrspace(3)* %127, align 4, !tbaa !7
  %136 = or i32 %93, 3
  %137 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @pre_sort_blk_data, i32 0, i32 %136
  %138 = load i32, i32 addrspace(3)* %137, align 4, !tbaa !7
  %139 = lshr i32 %138, %7
  %140 = and i32 %139, %6
  %141 = getelementptr inbounds i32, i32 addrspace(3)* %21, i32 %140
  %142 = load i32, i32 addrspace(3)* %141, align 4, !tbaa !7
  %143 = add i32 %142, %16
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %144
  store i32 %138, i32 addrspace(1)* %145, align 4, !tbaa !7
  %146 = getelementptr inbounds i32, i32 addrspace(3)* %17, i32 %136
  %147 = load i32, i32 addrspace(3)* %146, align 4, !tbaa !7
  %148 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %144
  store i32 %147, i32 addrspace(1)* %148, align 4, !tbaa !7
  %149 = add i32 %142, 1
  store i32 %149, i32 addrspace(3)* %141, align 4, !tbaa !7
  %150 = add nuw nsw i32 %93, 4
  %151 = add nuw i32 %94, 4
  %152 = icmp eq i32 %151, %82
  br i1 %152, label %153, label %92, !llvm.loop !16

153:                                              ; preds = %92, %78
  %154 = phi i32 [ 0, %78 ], [ %150, %92 ]
  %155 = icmp eq i32 %79, 0
  br i1 %155, label %175, label %156

156:                                              ; preds = %153, %156
  %157 = phi i32 [ %172, %156 ], [ %154, %153 ]
  %158 = phi i32 [ %173, %156 ], [ 0, %153 ]
  %159 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @pre_sort_blk_data, i32 0, i32 %157
  %160 = load i32, i32 addrspace(3)* %159, align 4, !tbaa !7
  %161 = lshr i32 %160, %7
  %162 = and i32 %161, %6
  %163 = getelementptr inbounds i32, i32 addrspace(3)* %21, i32 %162
  %164 = load i32, i32 addrspace(3)* %163, align 4, !tbaa !7
  %165 = add i32 %164, %16
  %166 = zext i32 %165 to i64
  %167 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %166
  store i32 %160, i32 addrspace(1)* %167, align 4, !tbaa !7
  %168 = getelementptr inbounds i32, i32 addrspace(3)* %17, i32 %157
  %169 = load i32, i32 addrspace(3)* %168, align 4, !tbaa !7
  %170 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %166
  store i32 %169, i32 addrspace(1)* %170, align 4, !tbaa !7
  %171 = add i32 %164, 1
  store i32 %171, i32 addrspace(3)* %163, align 4, !tbaa !7
  %172 = add nuw nsw i32 %157, 1
  %173 = add i32 %158, 1
  %174 = icmp eq i32 %173, %79
  br i1 %174, label %175, label %156, !llvm.loop !17

175:                                              ; preds = %153, %156, %76
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
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
