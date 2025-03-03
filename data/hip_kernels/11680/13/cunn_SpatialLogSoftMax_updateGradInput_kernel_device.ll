; ModuleID = '../data/hip_kernels/11680/13/main.cu'
source_filename = "../data/hip_kernels/11680/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z45cunn_SpatialLogSoftMax_updateGradInput_kernelPfS_S_iii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = mul nsw i32 %5, %4
  %10 = mul i32 %9, %7
  %11 = icmp sgt i32 %3, 0
  %12 = mul i32 %7, %3
  %13 = mul i32 %12, %4
  %14 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = and i32 %3, 7
  %18 = icmp ult i32 %3, 8
  %19 = and i32 %3, -8
  %20 = icmp eq i32 %17, 0
  %21 = and i32 %3, 3
  %22 = icmp ult i32 %3, 4
  %23 = and i32 %3, -4
  %24 = icmp eq i32 %21, 0
  br label %25

25:                                               ; preds = %203, %6
  %26 = phi i32 [ %8, %6 ], [ %204, %203 ]
  %27 = icmp slt i32 %26, %9
  br i1 %27, label %28, label %205

28:                                               ; preds = %25
  %29 = freeze i32 %26
  %30 = freeze i32 %5
  %31 = sdiv i32 %29, %30
  %32 = mul i32 %31, %30
  %33 = sub i32 %29, %32
  %34 = icmp slt i32 %31, %4
  br i1 %34, label %35, label %203

35:                                               ; preds = %28
  %36 = mul i32 %31, %5
  %37 = add i32 %36, %10
  %38 = add i32 %37, %33
  %39 = mul i32 %38, %3
  br i1 %11, label %40, label %57

40:                                               ; preds = %35
  br i1 %18, label %41, label %63

41:                                               ; preds = %63, %40
  %42 = phi float [ undef, %40 ], [ %113, %63 ]
  %43 = phi i32 [ 0, %40 ], [ %114, %63 ]
  %44 = phi float [ 0.000000e+00, %40 ], [ %113, %63 ]
  br i1 %20, label %57, label %45

45:                                               ; preds = %41, %45
  %46 = phi i32 [ %54, %45 ], [ %43, %41 ]
  %47 = phi float [ %53, %45 ], [ %44, %41 ]
  %48 = phi i32 [ %55, %45 ], [ 0, %41 ]
  %49 = add nsw i32 %46, %39
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5
  %53 = fadd contract float %47, %52
  %54 = add nuw nsw i32 %46, 1
  %55 = add i32 %48, 1
  %56 = icmp eq i32 %55, %17
  br i1 %56, label %57, label %45, !llvm.loop !9

57:                                               ; preds = %41, %45, %35
  %58 = phi float [ 0.000000e+00, %35 ], [ %42, %41 ], [ %53, %45 ]
  br i1 %11, label %59, label %138

59:                                               ; preds = %57
  %60 = add i32 %31, %13
  %61 = mul i32 %60, %5
  %62 = add i32 %61, %33
  br i1 %22, label %117, label %142

63:                                               ; preds = %40, %63
  %64 = phi i32 [ %114, %63 ], [ 0, %40 ]
  %65 = phi float [ %113, %63 ], [ 0.000000e+00, %40 ]
  %66 = phi i32 [ %115, %63 ], [ 0, %40 ]
  %67 = add nsw i32 %64, %39
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %2, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5
  %71 = fadd contract float %65, %70
  %72 = or i32 %64, 1
  %73 = add nsw i32 %72, %39
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %2, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5
  %77 = fadd contract float %71, %76
  %78 = or i32 %64, 2
  %79 = add nsw i32 %78, %39
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5
  %83 = fadd contract float %77, %82
  %84 = or i32 %64, 3
  %85 = add nsw i32 %84, %39
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5
  %89 = fadd contract float %83, %88
  %90 = or i32 %64, 4
  %91 = add nsw i32 %90, %39
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %2, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !5
  %95 = fadd contract float %89, %94
  %96 = or i32 %64, 5
  %97 = add nsw i32 %96, %39
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %2, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !5
  %101 = fadd contract float %95, %100
  %102 = or i32 %64, 6
  %103 = add nsw i32 %102, %39
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %2, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5
  %107 = fadd contract float %101, %106
  %108 = or i32 %64, 7
  %109 = add nsw i32 %108, %39
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %2, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !5
  %113 = fadd contract float %107, %112
  %114 = add nuw nsw i32 %64, 8
  %115 = add i32 %66, 8
  %116 = icmp eq i32 %115, %19
  br i1 %116, label %41, label %63, !llvm.loop !11

117:                                              ; preds = %142, %59
  %118 = phi i32 [ 0, %59 ], [ %200, %142 ]
  br i1 %24, label %138, label %119

119:                                              ; preds = %117, %119
  %120 = phi i32 [ %135, %119 ], [ %118, %117 ]
  %121 = phi i32 [ %136, %119 ], [ 0, %117 ]
  %122 = mul nsw i32 %120, %9
  %123 = add i32 %62, %122
  %124 = add nsw i32 %120, %39
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %2, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !5
  %128 = getelementptr inbounds float, float addrspace(1)* %1, i64 %125
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !5
  %130 = tail call float @llvm.exp.f32(float %129)
  %131 = fmul contract float %58, %130
  %132 = fsub contract float %127, %131
  %133 = sext i32 %123 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  store float %132, float addrspace(1)* %134, align 4, !tbaa !5
  %135 = add nuw nsw i32 %120, 1
  %136 = add i32 %121, 1
  %137 = icmp eq i32 %136, %21
  br i1 %137, label %138, label %119, !llvm.loop !13

138:                                              ; preds = %117, %119, %57
  %139 = load i16, i16 addrspace(4)* %16, align 4, !range !14, !invariant.load !15
  %140 = zext i16 %139 to i32
  %141 = add i32 %26, %140
  br label %203

142:                                              ; preds = %59, %142
  %143 = phi i32 [ %200, %142 ], [ 0, %59 ]
  %144 = phi i32 [ %201, %142 ], [ 0, %59 ]
  %145 = mul nsw i32 %143, %9
  %146 = add i32 %62, %145
  %147 = add nsw i32 %143, %39
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %2, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !5
  %151 = getelementptr inbounds float, float addrspace(1)* %1, i64 %148
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !5
  %153 = tail call float @llvm.exp.f32(float %152)
  %154 = fmul contract float %58, %153
  %155 = fsub contract float %150, %154
  %156 = sext i32 %146 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %0, i64 %156
  store float %155, float addrspace(1)* %157, align 4, !tbaa !5
  %158 = or i32 %143, 1
  %159 = mul nsw i32 %158, %9
  %160 = add i32 %62, %159
  %161 = add nsw i32 %158, %39
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %2, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !5
  %165 = getelementptr inbounds float, float addrspace(1)* %1, i64 %162
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !5
  %167 = tail call float @llvm.exp.f32(float %166)
  %168 = fmul contract float %58, %167
  %169 = fsub contract float %164, %168
  %170 = sext i32 %160 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %0, i64 %170
  store float %169, float addrspace(1)* %171, align 4, !tbaa !5
  %172 = or i32 %143, 2
  %173 = mul nsw i32 %172, %9
  %174 = add i32 %62, %173
  %175 = add nsw i32 %172, %39
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %2, i64 %176
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !5
  %179 = getelementptr inbounds float, float addrspace(1)* %1, i64 %176
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !5
  %181 = tail call float @llvm.exp.f32(float %180)
  %182 = fmul contract float %58, %181
  %183 = fsub contract float %178, %182
  %184 = sext i32 %174 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %0, i64 %184
  store float %183, float addrspace(1)* %185, align 4, !tbaa !5
  %186 = or i32 %143, 3
  %187 = mul nsw i32 %186, %9
  %188 = add i32 %62, %187
  %189 = add nsw i32 %186, %39
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %2, i64 %190
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !5
  %193 = getelementptr inbounds float, float addrspace(1)* %1, i64 %190
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !5
  %195 = tail call float @llvm.exp.f32(float %194)
  %196 = fmul contract float %58, %195
  %197 = fsub contract float %192, %196
  %198 = sext i32 %188 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %0, i64 %198
  store float %197, float addrspace(1)* %199, align 4, !tbaa !5
  %200 = add nuw nsw i32 %143, 4
  %201 = add i32 %144, 4
  %202 = icmp eq i32 %201, %23
  br i1 %202, label %117, label %142, !llvm.loop !16

203:                                              ; preds = %28, %138
  %204 = phi i32 [ %141, %138 ], [ %26, %28 ]
  br i1 %34, label %25, label %205

205:                                              ; preds = %203, %25
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !10}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = distinct !{!16, !12}
