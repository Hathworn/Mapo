; ModuleID = '../data/hip_kernels/553/18/main.cu'
source_filename = "../data/hip_kernels/553/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16CalculateSampleTPKfS0_PfPiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 2, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %26 = add i32 %24, %25
  %27 = mul nsw i32 %18, %6
  %28 = add nsw i32 %27, %26
  %29 = icmp slt i32 %18, %7
  %30 = icmp slt i32 %26, %6
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %204

32:                                               ; preds = %9
  %33 = mul nsw i32 %18, %8
  %34 = mul nsw i32 %26, %8
  %35 = icmp sgt i32 %8, 0
  br i1 %35, label %36, label %51

36:                                               ; preds = %32
  %37 = and i32 %8, 1
  %38 = icmp eq i32 %8, 1
  %39 = and i32 %8, -2
  %40 = icmp eq i32 %37, 0
  br label %41

41:                                               ; preds = %36, %118
  %42 = phi i32 [ %123, %118 ], [ 0, %36 ]
  %43 = phi i32 [ %124, %118 ], [ 0, %36 ]
  %44 = phi i32 [ %122, %118 ], [ 0, %36 ]
  %45 = phi float [ %121, %118 ], [ 0.000000e+00, %36 ]
  %46 = phi float [ %120, %118 ], [ 0.000000e+00, %36 ]
  %47 = phi float [ %119, %118 ], [ 0.000000e+00, %36 ]
  %48 = add nsw i32 %43, %33
  %49 = icmp slt i32 %48, %5
  %50 = mul nsw i32 %48, %4
  br i1 %38, label %78, label %126

51:                                               ; preds = %118, %32
  %52 = phi float [ 0.000000e+00, %32 ], [ %119, %118 ]
  %53 = phi float [ 0.000000e+00, %32 ], [ %120, %118 ]
  %54 = phi float [ 0.000000e+00, %32 ], [ %121, %118 ]
  %55 = phi i32 [ 0, %32 ], [ %122, %118 ]
  %56 = phi i32 [ 0, %32 ], [ %123, %118 ]
  %57 = sext i32 %28 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %57
  store i32 %55, i32 addrspace(1)* %58, align 4, !tbaa !7
  %59 = sitofp i32 %56 to float
  %60 = fdiv contract float %52, %59
  %61 = mul nsw i32 %28, 3
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !11, !amdgpu.noclobber !5
  %65 = fadd contract float %60, %64
  store float %65, float addrspace(1)* %63, align 4, !tbaa !11
  %66 = fdiv contract float %53, %59
  %67 = add nsw i32 %61, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %2, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !11, !amdgpu.noclobber !5
  %71 = fadd contract float %66, %70
  store float %71, float addrspace(1)* %69, align 4, !tbaa !11
  %72 = fdiv contract float %54, %59
  %73 = add nsw i32 %61, 2
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %2, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !11, !amdgpu.noclobber !5
  %77 = fadd contract float %72, %76
  store float %77, float addrspace(1)* %75, align 4, !tbaa !11
  br label %204

78:                                               ; preds = %195, %41
  %79 = phi float [ undef, %41 ], [ %196, %195 ]
  %80 = phi float [ undef, %41 ], [ %197, %195 ]
  %81 = phi float [ undef, %41 ], [ %198, %195 ]
  %82 = phi i32 [ undef, %41 ], [ %199, %195 ]
  %83 = phi i32 [ undef, %41 ], [ %200, %195 ]
  %84 = phi i32 [ %42, %41 ], [ %200, %195 ]
  %85 = phi i32 [ 0, %41 ], [ %201, %195 ]
  %86 = phi i32 [ %44, %41 ], [ %199, %195 ]
  %87 = phi float [ %45, %41 ], [ %198, %195 ]
  %88 = phi float [ %46, %41 ], [ %197, %195 ]
  %89 = phi float [ %47, %41 ], [ %196, %195 ]
  br i1 %40, label %118, label %90

90:                                               ; preds = %78
  br i1 %49, label %91, label %118

91:                                               ; preds = %90
  %92 = add nsw i32 %85, %34
  %93 = icmp slt i32 %92, %4
  br i1 %93, label %94, label %118

94:                                               ; preds = %91
  %95 = add nsw i32 %92, %50
  %96 = mul nsw i32 %95, 3
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !11, !amdgpu.noclobber !5
  %100 = fadd contract float %89, %99
  %101 = add nsw i32 %96, 1
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !11, !amdgpu.noclobber !5
  %105 = fadd contract float %88, %104
  %106 = add nsw i32 %96, 2
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !11, !amdgpu.noclobber !5
  %110 = fadd contract float %87, %109
  %111 = sext i32 %95 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !11, !amdgpu.noclobber !5
  %114 = fcmp contract ogt float %113, 1.270000e+02
  %115 = zext i1 %114 to i32
  %116 = or i32 %86, %115
  %117 = add nsw i32 %84, 1
  br label %118

118:                                              ; preds = %90, %91, %94, %78
  %119 = phi float [ %79, %78 ], [ %100, %94 ], [ %89, %91 ], [ %89, %90 ]
  %120 = phi float [ %80, %78 ], [ %105, %94 ], [ %88, %91 ], [ %88, %90 ]
  %121 = phi float [ %81, %78 ], [ %110, %94 ], [ %87, %91 ], [ %87, %90 ]
  %122 = phi i32 [ %82, %78 ], [ %116, %94 ], [ %86, %91 ], [ %86, %90 ]
  %123 = phi i32 [ %83, %78 ], [ %117, %94 ], [ %84, %91 ], [ %84, %90 ]
  %124 = add nuw nsw i32 %43, 1
  %125 = icmp eq i32 %124, %8
  br i1 %125, label %51, label %41, !llvm.loop !13

126:                                              ; preds = %41, %195
  %127 = phi i32 [ %200, %195 ], [ %42, %41 ]
  %128 = phi i32 [ %201, %195 ], [ 0, %41 ]
  %129 = phi i32 [ %199, %195 ], [ %44, %41 ]
  %130 = phi float [ %198, %195 ], [ %45, %41 ]
  %131 = phi float [ %197, %195 ], [ %46, %41 ]
  %132 = phi float [ %196, %195 ], [ %47, %41 ]
  %133 = phi i32 [ %202, %195 ], [ 0, %41 ]
  br i1 %49, label %134, label %161

134:                                              ; preds = %126
  %135 = add nsw i32 %128, %34
  %136 = icmp slt i32 %135, %4
  br i1 %136, label %137, label %161

137:                                              ; preds = %134
  %138 = add nsw i32 %135, %50
  %139 = mul nsw i32 %138, 3
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %0, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !11, !amdgpu.noclobber !5
  %143 = fadd contract float %132, %142
  %144 = add nsw i32 %139, 1
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !11, !amdgpu.noclobber !5
  %148 = fadd contract float %131, %147
  %149 = add nsw i32 %139, 2
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %0, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !11, !amdgpu.noclobber !5
  %153 = fadd contract float %130, %152
  %154 = sext i32 %138 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %1, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !11, !amdgpu.noclobber !5
  %157 = fcmp contract ogt float %156, 1.270000e+02
  %158 = zext i1 %157 to i32
  %159 = or i32 %129, %158
  %160 = add nsw i32 %127, 1
  br label %161

161:                                              ; preds = %126, %134, %137
  %162 = phi float [ %143, %137 ], [ %132, %134 ], [ %132, %126 ]
  %163 = phi float [ %148, %137 ], [ %131, %134 ], [ %131, %126 ]
  %164 = phi float [ %153, %137 ], [ %130, %134 ], [ %130, %126 ]
  %165 = phi i32 [ %159, %137 ], [ %129, %134 ], [ %129, %126 ]
  %166 = phi i32 [ %160, %137 ], [ %127, %134 ], [ %127, %126 ]
  br i1 %49, label %167, label %195

167:                                              ; preds = %161
  %168 = or i32 %128, 1
  %169 = add nsw i32 %168, %34
  %170 = icmp slt i32 %169, %4
  br i1 %170, label %171, label %195

171:                                              ; preds = %167
  %172 = add nsw i32 %169, %50
  %173 = mul nsw i32 %172, 3
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %0, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !11, !amdgpu.noclobber !5
  %177 = fadd contract float %162, %176
  %178 = add nsw i32 %173, 1
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %0, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !11, !amdgpu.noclobber !5
  %182 = fadd contract float %163, %181
  %183 = add nsw i32 %173, 2
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %0, i64 %184
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !11, !amdgpu.noclobber !5
  %187 = fadd contract float %164, %186
  %188 = sext i32 %172 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %1, i64 %188
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !11, !amdgpu.noclobber !5
  %191 = fcmp contract ogt float %190, 1.270000e+02
  %192 = zext i1 %191 to i32
  %193 = or i32 %165, %192
  %194 = add nsw i32 %166, 1
  br label %195

195:                                              ; preds = %171, %167, %161
  %196 = phi float [ %177, %171 ], [ %162, %167 ], [ %162, %161 ]
  %197 = phi float [ %182, %171 ], [ %163, %167 ], [ %163, %161 ]
  %198 = phi float [ %187, %171 ], [ %164, %167 ], [ %164, %161 ]
  %199 = phi i32 [ %193, %171 ], [ %165, %167 ], [ %165, %161 ]
  %200 = phi i32 [ %194, %171 ], [ %166, %167 ], [ %166, %161 ]
  %201 = add nuw nsw i32 %128, 2
  %202 = add i32 %133, 2
  %203 = icmp eq i32 %202, %39
  br i1 %203, label %78, label %126, !llvm.loop !15

204:                                              ; preds = %51, %9
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
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
