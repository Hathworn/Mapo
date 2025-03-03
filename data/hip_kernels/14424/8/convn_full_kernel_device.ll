; ModuleID = '../data/hip_kernels/14424/8/main.cu'
source_filename = "../data/hip_kernels/14424/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17convn_full_kernelPfS_S_iiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = add nsw i32 %3, -1
  %26 = add i32 %25, %5
  %27 = icmp slt i32 %16, %26
  br i1 %27, label %28, label %175

28:                                               ; preds = %7
  %29 = add nsw i32 %4, -1
  %30 = add i32 %29, %6
  %31 = icmp slt i32 %24, %30
  br i1 %31, label %32, label %175

32:                                               ; preds = %28
  %33 = icmp sgt i32 %6, 0
  br i1 %33, label %34, label %49

34:                                               ; preds = %32
  %35 = icmp sgt i32 %5, 0
  %36 = and i32 %5, 3
  %37 = icmp ult i32 %5, 4
  %38 = and i32 %5, -4
  %39 = icmp eq i32 %36, 0
  br label %40

40:                                               ; preds = %34, %85
  %41 = phi float [ 0.000000e+00, %34 ], [ %86, %85 ]
  %42 = phi i32 [ 0, %34 ], [ %87, %85 ]
  br i1 %35, label %43, label %85

43:                                               ; preds = %40
  %44 = sub nsw i32 %24, %42
  %45 = icmp slt i32 %44, 0
  %46 = icmp slt i32 %44, %4
  %47 = mul nsw i32 %42, %5
  %48 = mul nsw i32 %44, %3
  br i1 %37, label %55, label %89

49:                                               ; preds = %85, %32
  %50 = phi float [ 0.000000e+00, %32 ], [ %86, %85 ]
  %51 = mul nsw i32 %24, %26
  %52 = add nsw i32 %51, %16
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  store float %50, float addrspace(1)* %54, align 4, !tbaa !7
  br label %175

55:                                               ; preds = %170, %43
  %56 = phi float [ undef, %43 ], [ %171, %170 ]
  %57 = phi float [ %41, %43 ], [ %171, %170 ]
  %58 = phi i32 [ 0, %43 ], [ %172, %170 ]
  br i1 %39, label %85, label %59

59:                                               ; preds = %55, %80
  %60 = phi float [ %81, %80 ], [ %57, %55 ]
  %61 = phi i32 [ %82, %80 ], [ %58, %55 ]
  %62 = phi i32 [ %83, %80 ], [ 0, %55 ]
  %63 = sub nsw i32 %16, %61
  br i1 %45, label %80, label %64

64:                                               ; preds = %59
  %65 = icmp sgt i32 %63, -1
  %66 = select i1 %46, i1 %65, i1 false
  %67 = icmp slt i32 %63, %3
  %68 = select i1 %66, i1 %67, i1 false
  br i1 %68, label %69, label %80

69:                                               ; preds = %64
  %70 = add nsw i32 %61, %47
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %2, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = add nsw i32 %63, %48
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = fmul contract float %73, %77
  %79 = fadd contract float %60, %78
  br label %80

80:                                               ; preds = %69, %64, %59
  %81 = phi float [ %79, %69 ], [ %60, %64 ], [ %60, %59 ]
  %82 = add nuw nsw i32 %61, 1
  %83 = add i32 %62, 1
  %84 = icmp eq i32 %83, %36
  br i1 %84, label %85, label %59, !llvm.loop !11

85:                                               ; preds = %55, %80, %40
  %86 = phi float [ %41, %40 ], [ %56, %55 ], [ %81, %80 ]
  %87 = add nuw nsw i32 %42, 1
  %88 = icmp eq i32 %87, %6
  br i1 %88, label %49, label %40, !llvm.loop !13

89:                                               ; preds = %43, %170
  %90 = phi float [ %171, %170 ], [ %41, %43 ]
  %91 = phi i32 [ %172, %170 ], [ 0, %43 ]
  %92 = phi i32 [ %173, %170 ], [ 0, %43 ]
  %93 = sub nsw i32 %16, %91
  br i1 %45, label %110, label %94

94:                                               ; preds = %89
  %95 = icmp sgt i32 %93, -1
  %96 = select i1 %46, i1 %95, i1 false
  %97 = icmp slt i32 %93, %3
  %98 = select i1 %96, i1 %97, i1 false
  br i1 %98, label %99, label %110

99:                                               ; preds = %94
  %100 = add nsw i32 %91, %47
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = add nsw i32 %93, %48
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = fmul contract float %103, %107
  %109 = fadd contract float %90, %108
  br label %110

110:                                              ; preds = %89, %94, %99
  %111 = phi float [ %109, %99 ], [ %90, %94 ], [ %90, %89 ]
  %112 = or i32 %91, 1
  %113 = sub nsw i32 %16, %112
  br i1 %45, label %130, label %114

114:                                              ; preds = %110
  %115 = icmp sgt i32 %113, -1
  %116 = select i1 %46, i1 %115, i1 false
  %117 = icmp slt i32 %113, %3
  %118 = select i1 %116, i1 %117, i1 false
  br i1 %118, label %119, label %130

119:                                              ; preds = %114
  %120 = add nsw i32 %112, %47
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %2, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !7, !amdgpu.noclobber !5
  %124 = add nsw i32 %113, %48
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %1, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !5
  %128 = fmul contract float %123, %127
  %129 = fadd contract float %111, %128
  br label %130

130:                                              ; preds = %119, %114, %110
  %131 = phi float [ %129, %119 ], [ %111, %114 ], [ %111, %110 ]
  %132 = or i32 %91, 2
  %133 = sub nsw i32 %16, %132
  br i1 %45, label %150, label %134

134:                                              ; preds = %130
  %135 = icmp sgt i32 %133, -1
  %136 = select i1 %46, i1 %135, i1 false
  %137 = icmp slt i32 %133, %3
  %138 = select i1 %136, i1 %137, i1 false
  br i1 %138, label %139, label %150

139:                                              ; preds = %134
  %140 = add nsw i32 %132, %47
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %2, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7, !amdgpu.noclobber !5
  %144 = add nsw i32 %133, %48
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %1, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7, !amdgpu.noclobber !5
  %148 = fmul contract float %143, %147
  %149 = fadd contract float %131, %148
  br label %150

150:                                              ; preds = %139, %134, %130
  %151 = phi float [ %149, %139 ], [ %131, %134 ], [ %131, %130 ]
  %152 = or i32 %91, 3
  %153 = sub nsw i32 %16, %152
  br i1 %45, label %170, label %154

154:                                              ; preds = %150
  %155 = icmp sgt i32 %153, -1
  %156 = select i1 %46, i1 %155, i1 false
  %157 = icmp slt i32 %153, %3
  %158 = select i1 %156, i1 %157, i1 false
  br i1 %158, label %159, label %170

159:                                              ; preds = %154
  %160 = add nsw i32 %152, %47
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %2, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7, !amdgpu.noclobber !5
  %164 = add nsw i32 %153, %48
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %1, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !7, !amdgpu.noclobber !5
  %168 = fmul contract float %163, %167
  %169 = fadd contract float %151, %168
  br label %170

170:                                              ; preds = %159, %154, %150
  %171 = phi float [ %169, %159 ], [ %151, %154 ], [ %151, %150 ]
  %172 = add nuw nsw i32 %91, 4
  %173 = add i32 %92, 4
  %174 = icmp eq i32 %173, %38
  br i1 %174, label %55, label %89, !llvm.loop !15

175:                                              ; preds = %7, %28, %49
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
