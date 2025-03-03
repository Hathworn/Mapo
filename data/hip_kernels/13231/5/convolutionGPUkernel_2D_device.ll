; ModuleID = '../data/hip_kernels/13231/5/main.cu'
source_filename = "../data/hip_kernels/13231/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23convolutionGPUkernel_2DPiS_S_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %15, %4
  %25 = icmp slt i32 %23, %3
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %171

27:                                               ; preds = %6
  %28 = sdiv i32 %5, 2
  %29 = sub nsw i32 %15, %28
  %30 = sub nsw i32 %23, %28
  %31 = icmp sgt i32 %5, 0
  br i1 %31, label %32, label %45

32:                                               ; preds = %27
  %33 = and i32 %5, 3
  %34 = icmp ult i32 %5, 4
  %35 = and i32 %5, -4
  %36 = icmp eq i32 %33, 0
  br label %37

37:                                               ; preds = %32, %81
  %38 = phi i32 [ %82, %81 ], [ 0, %32 ]
  %39 = phi i32 [ %83, %81 ], [ 0, %32 ]
  %40 = add nsw i32 %39, %30
  %41 = icmp sgt i32 %40, -1
  %42 = icmp slt i32 %40, %3
  %43 = mul nsw i32 %40, %3
  %44 = mul nsw i32 %39, %5
  br i1 %34, label %51, label %85

45:                                               ; preds = %81, %27
  %46 = phi i32 [ 0, %27 ], [ %82, %81 ]
  %47 = mul nsw i32 %23, %4
  %48 = add nsw i32 %47, %15
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %49
  store i32 %46, i32 addrspace(1)* %50, align 4, !tbaa !7
  br label %171

51:                                               ; preds = %166, %37
  %52 = phi i32 [ undef, %37 ], [ %167, %166 ]
  %53 = phi i32 [ %38, %37 ], [ %167, %166 ]
  %54 = phi i32 [ 0, %37 ], [ %168, %166 ]
  br i1 %36, label %81, label %55

55:                                               ; preds = %51, %76
  %56 = phi i32 [ %77, %76 ], [ %53, %51 ]
  %57 = phi i32 [ %78, %76 ], [ %54, %51 ]
  %58 = phi i32 [ %79, %76 ], [ 0, %51 ]
  %59 = add nsw i32 %57, %29
  br i1 %41, label %60, label %76

60:                                               ; preds = %55
  %61 = icmp sgt i32 %59, -1
  %62 = select i1 %42, i1 %61, i1 false
  %63 = icmp slt i32 %59, %4
  %64 = select i1 %62, i1 %63, i1 false
  br i1 %64, label %65, label %76

65:                                               ; preds = %60
  %66 = add nsw i32 %59, %43
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = add nsw i32 %57, %44
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = mul nsw i32 %73, %69
  %75 = add nsw i32 %74, %56
  br label %76

76:                                               ; preds = %65, %60, %55
  %77 = phi i32 [ %75, %65 ], [ %56, %60 ], [ %56, %55 ]
  %78 = add nuw nsw i32 %57, 1
  %79 = add i32 %58, 1
  %80 = icmp eq i32 %79, %33
  br i1 %80, label %81, label %55, !llvm.loop !11

81:                                               ; preds = %76, %51
  %82 = phi i32 [ %52, %51 ], [ %77, %76 ]
  %83 = add nuw nsw i32 %39, 1
  %84 = icmp eq i32 %83, %5
  br i1 %84, label %45, label %37, !llvm.loop !13

85:                                               ; preds = %37, %166
  %86 = phi i32 [ %167, %166 ], [ %38, %37 ]
  %87 = phi i32 [ %168, %166 ], [ 0, %37 ]
  %88 = phi i32 [ %169, %166 ], [ 0, %37 ]
  %89 = add nsw i32 %87, %29
  br i1 %41, label %90, label %106

90:                                               ; preds = %85
  %91 = icmp sgt i32 %89, -1
  %92 = select i1 %42, i1 %91, i1 false
  %93 = icmp slt i32 %89, %4
  %94 = select i1 %92, i1 %93, i1 false
  br i1 %94, label %95, label %106

95:                                               ; preds = %90
  %96 = add nsw i32 %89, %43
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %97
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !5
  %100 = add nsw i32 %87, %44
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %101
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = mul nsw i32 %103, %99
  %105 = add nsw i32 %104, %86
  br label %106

106:                                              ; preds = %95, %90, %85
  %107 = phi i32 [ %105, %95 ], [ %86, %90 ], [ %86, %85 ]
  %108 = or i32 %87, 1
  %109 = add nsw i32 %108, %29
  br i1 %41, label %110, label %126

110:                                              ; preds = %106
  %111 = icmp sgt i32 %109, -1
  %112 = select i1 %42, i1 %111, i1 false
  %113 = icmp slt i32 %109, %4
  %114 = select i1 %112, i1 %113, i1 false
  br i1 %114, label %115, label %126

115:                                              ; preds = %110
  %116 = add nsw i32 %109, %43
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %117
  %119 = load i32, i32 addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !5
  %120 = add nsw i32 %108, %44
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %121
  %123 = load i32, i32 addrspace(1)* %122, align 4, !tbaa !7, !amdgpu.noclobber !5
  %124 = mul nsw i32 %123, %119
  %125 = add nsw i32 %124, %107
  br label %126

126:                                              ; preds = %115, %110, %106
  %127 = phi i32 [ %125, %115 ], [ %107, %110 ], [ %107, %106 ]
  %128 = or i32 %87, 2
  %129 = add nsw i32 %128, %29
  br i1 %41, label %130, label %146

130:                                              ; preds = %126
  %131 = icmp sgt i32 %129, -1
  %132 = select i1 %42, i1 %131, i1 false
  %133 = icmp slt i32 %129, %4
  %134 = select i1 %132, i1 %133, i1 false
  br i1 %134, label %135, label %146

135:                                              ; preds = %130
  %136 = add nsw i32 %129, %43
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %137
  %139 = load i32, i32 addrspace(1)* %138, align 4, !tbaa !7, !amdgpu.noclobber !5
  %140 = add nsw i32 %128, %44
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %141
  %143 = load i32, i32 addrspace(1)* %142, align 4, !tbaa !7, !amdgpu.noclobber !5
  %144 = mul nsw i32 %143, %139
  %145 = add nsw i32 %144, %127
  br label %146

146:                                              ; preds = %135, %130, %126
  %147 = phi i32 [ %145, %135 ], [ %127, %130 ], [ %127, %126 ]
  %148 = or i32 %87, 3
  %149 = add nsw i32 %148, %29
  br i1 %41, label %150, label %166

150:                                              ; preds = %146
  %151 = icmp sgt i32 %149, -1
  %152 = select i1 %42, i1 %151, i1 false
  %153 = icmp slt i32 %149, %4
  %154 = select i1 %152, i1 %153, i1 false
  br i1 %154, label %155, label %166

155:                                              ; preds = %150
  %156 = add nsw i32 %149, %43
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %157
  %159 = load i32, i32 addrspace(1)* %158, align 4, !tbaa !7, !amdgpu.noclobber !5
  %160 = add nsw i32 %148, %44
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %161
  %163 = load i32, i32 addrspace(1)* %162, align 4, !tbaa !7, !amdgpu.noclobber !5
  %164 = mul nsw i32 %163, %159
  %165 = add nsw i32 %164, %147
  br label %166

166:                                              ; preds = %155, %150, %146
  %167 = phi i32 [ %165, %155 ], [ %147, %150 ], [ %147, %146 ]
  %168 = add nuw nsw i32 %87, 4
  %169 = add i32 %88, 4
  %170 = icmp eq i32 %169, %35
  br i1 %170, label %51, label %85, !llvm.loop !15

171:                                              ; preds = %45, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
