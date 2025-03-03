; ModuleID = '../data/hip_kernels/6493/57/main.cu'
source_filename = "../data/hip_kernels/6493/57/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z32AssembleArrayOfAbsorptionFactorsiiiPKfS0_PKiS0_Pf(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %11, %15
  %17 = add i32 %16, %9
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = add i32 %24, %18
  %26 = mul nsw i32 %25, %1
  %27 = add nsw i32 %26, %17
  %28 = icmp slt i32 %17, %1
  %29 = icmp slt i32 %25, %0
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %221

31:                                               ; preds = %8
  %32 = mul nsw i32 %17, %2
  %33 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !7, !amdgpu.noclobber !6
  %34 = add nsw i32 %33, -1
  %35 = mul nsw i32 %25, 7
  %36 = add nsw i32 %35, 6
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %6, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !11, !amdgpu.noclobber !6
  %40 = fpext float %39 to double
  %41 = fmul contract double %40, 1.000000e+22
  %42 = fptrunc double %41 to float
  %43 = sext i32 %34 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %4, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !11, !amdgpu.noclobber !6
  %46 = sext i32 %32 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %3, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !11, !amdgpu.noclobber !6
  %49 = fmul contract float %45, %48
  %50 = icmp sgt i32 %2, 1
  br i1 %50, label %51, label %201

51:                                               ; preds = %31
  %52 = add i32 %2, -1
  %53 = add i32 %2, -2
  %54 = and i32 %52, 7
  %55 = icmp ult i32 %53, 7
  br i1 %55, label %176, label %56

56:                                               ; preds = %51
  %57 = and i32 %52, -8
  br label %58

58:                                               ; preds = %58, %56
  %59 = phi i32 [ 1, %56 ], [ %173, %58 ]
  %60 = phi float [ %49, %56 ], [ %172, %58 ]
  %61 = phi i32 [ 0, %56 ], [ %174, %58 ]
  %62 = add nsw i32 %59, %32
  %63 = zext i32 %59 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = add nsw i32 %65, -1
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %4, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !11, !amdgpu.noclobber !6
  %70 = sext i32 %62 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %3, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !11, !amdgpu.noclobber !6
  %73 = fmul contract float %69, %72
  %74 = fadd contract float %60, %73
  %75 = add nuw nsw i32 %59, 1
  %76 = add nsw i32 %75, %32
  %77 = zext i32 %75 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !6
  %80 = add nsw i32 %79, -1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %4, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !11, !amdgpu.noclobber !6
  %84 = sext i32 %76 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %3, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !11, !amdgpu.noclobber !6
  %87 = fmul contract float %83, %86
  %88 = fadd contract float %74, %87
  %89 = add nuw nsw i32 %59, 2
  %90 = add nsw i32 %89, %32
  %91 = zext i32 %89 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !6
  %94 = add nsw i32 %93, -1
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %4, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !11, !amdgpu.noclobber !6
  %98 = sext i32 %90 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %3, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !11, !amdgpu.noclobber !6
  %101 = fmul contract float %97, %100
  %102 = fadd contract float %88, %101
  %103 = add nuw nsw i32 %59, 3
  %104 = add nsw i32 %103, %32
  %105 = zext i32 %103 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %105
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !6
  %108 = add nsw i32 %107, -1
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %4, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !11, !amdgpu.noclobber !6
  %112 = sext i32 %104 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %3, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !11, !amdgpu.noclobber !6
  %115 = fmul contract float %111, %114
  %116 = fadd contract float %102, %115
  %117 = add nuw nsw i32 %59, 4
  %118 = add nsw i32 %117, %32
  %119 = zext i32 %117 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !6
  %122 = add nsw i32 %121, -1
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %4, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !11, !amdgpu.noclobber !6
  %126 = sext i32 %118 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %3, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !11, !amdgpu.noclobber !6
  %129 = fmul contract float %125, %128
  %130 = fadd contract float %116, %129
  %131 = add nuw nsw i32 %59, 5
  %132 = add nsw i32 %131, %32
  %133 = zext i32 %131 to i64
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %133
  %135 = load i32, i32 addrspace(1)* %134, align 4, !tbaa !7, !amdgpu.noclobber !6
  %136 = add nsw i32 %135, -1
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %4, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !11, !amdgpu.noclobber !6
  %140 = sext i32 %132 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %3, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !11, !amdgpu.noclobber !6
  %143 = fmul contract float %139, %142
  %144 = fadd contract float %130, %143
  %145 = add nuw nsw i32 %59, 6
  %146 = add nsw i32 %145, %32
  %147 = zext i32 %145 to i64
  %148 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %147
  %149 = load i32, i32 addrspace(1)* %148, align 4, !tbaa !7, !amdgpu.noclobber !6
  %150 = add nsw i32 %149, -1
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %4, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !11, !amdgpu.noclobber !6
  %154 = sext i32 %146 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %3, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !11, !amdgpu.noclobber !6
  %157 = fmul contract float %153, %156
  %158 = fadd contract float %144, %157
  %159 = add nuw nsw i32 %59, 7
  %160 = add nsw i32 %159, %32
  %161 = zext i32 %159 to i64
  %162 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %161
  %163 = load i32, i32 addrspace(1)* %162, align 4, !tbaa !7, !amdgpu.noclobber !6
  %164 = add nsw i32 %163, -1
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %4, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !11, !amdgpu.noclobber !6
  %168 = sext i32 %160 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %3, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !11, !amdgpu.noclobber !6
  %171 = fmul contract float %167, %170
  %172 = fadd contract float %158, %171
  %173 = add nuw nsw i32 %59, 8
  %174 = add i32 %61, 8
  %175 = icmp eq i32 %174, %57
  br i1 %175, label %176, label %58, !llvm.loop !13

176:                                              ; preds = %58, %51
  %177 = phi float [ undef, %51 ], [ %172, %58 ]
  %178 = phi i32 [ 1, %51 ], [ %173, %58 ]
  %179 = phi float [ %49, %51 ], [ %172, %58 ]
  %180 = icmp eq i32 %54, 0
  br i1 %180, label %201, label %181

181:                                              ; preds = %176, %181
  %182 = phi i32 [ %198, %181 ], [ %178, %176 ]
  %183 = phi float [ %197, %181 ], [ %179, %176 ]
  %184 = phi i32 [ %199, %181 ], [ 0, %176 ]
  %185 = add nsw i32 %182, %32
  %186 = zext i32 %182 to i64
  %187 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %186
  %188 = load i32, i32 addrspace(1)* %187, align 4, !tbaa !7, !amdgpu.noclobber !6
  %189 = add nsw i32 %188, -1
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %4, i64 %190
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !11, !amdgpu.noclobber !6
  %193 = sext i32 %185 to i64
  %194 = getelementptr inbounds float, float addrspace(1)* %3, i64 %193
  %195 = load float, float addrspace(1)* %194, align 4, !tbaa !11, !amdgpu.noclobber !6
  %196 = fmul contract float %192, %195
  %197 = fadd contract float %183, %196
  %198 = add nuw nsw i32 %182, 1
  %199 = add i32 %184, 1
  %200 = icmp eq i32 %199, %54
  br i1 %200, label %201, label %181, !llvm.loop !15

201:                                              ; preds = %176, %181, %31
  %202 = phi float [ %49, %31 ], [ %177, %176 ], [ %197, %181 ]
  %203 = fneg contract float %42
  %204 = fmul contract float %202, %203
  %205 = fmul float %204, 0x3FF7154760000000
  %206 = tail call float @llvm.rint.f32(float %205)
  %207 = fcmp ogt float %204, 0x40562E4300000000
  %208 = fcmp olt float %204, 0xC059D1DA00000000
  %209 = fneg float %205
  %210 = tail call float @llvm.fma.f32(float %204, float 0x3FF7154760000000, float %209)
  %211 = tail call float @llvm.fma.f32(float %204, float 0x3E54AE0BE0000000, float %210)
  %212 = fsub float %205, %206
  %213 = fadd float %211, %212
  %214 = tail call float @llvm.exp2.f32(float %213)
  %215 = fptosi float %206 to i32
  %216 = tail call float @llvm.amdgcn.ldexp.f32(float %214, i32 %215)
  %217 = select i1 %208, float 0.000000e+00, float %216
  %218 = select i1 %207, float 0x7FF0000000000000, float %217
  %219 = sext i32 %27 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %7, i64 %219
  store float %218, float addrspace(1)* %220, align 4, !tbaa !11
  br label %221

221:                                              ; preds = %201, %8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
