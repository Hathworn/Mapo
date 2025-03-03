; ModuleID = '../data/hip_kernels/5366/6/main.cu'
source_filename = "../data/hip_kernels/5366/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18UpdateParamsLinearPfS_iiifS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, float %5, float addrspace(1)* nocapture %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 2, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %2
  %27 = icmp slt i32 %25, %4
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %252

29:                                               ; preds = %8
  %30 = icmp sgt i32 %3, 0
  br i1 %30, label %31, label %60

31:                                               ; preds = %29
  %32 = mul nsw i32 %17, %3
  %33 = mul nsw i32 %25, %3
  %34 = and i32 %3, 7
  %35 = icmp ult i32 %3, 8
  br i1 %35, label %38, label %36

36:                                               ; preds = %31
  %37 = and i32 %3, -8
  br label %79

38:                                               ; preds = %79, %31
  %39 = phi float [ undef, %31 ], [ %169, %79 ]
  %40 = phi i32 [ 0, %31 ], [ %170, %79 ]
  %41 = phi float [ 0.000000e+00, %31 ], [ %169, %79 ]
  %42 = icmp eq i32 %34, 0
  br i1 %42, label %60, label %43

43:                                               ; preds = %38, %43
  %44 = phi i32 [ %57, %43 ], [ %40, %38 ]
  %45 = phi float [ %56, %43 ], [ %41, %38 ]
  %46 = phi i32 [ %58, %43 ], [ 0, %38 ]
  %47 = add nsw i32 %44, %32
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = add nsw i32 %44, %33
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = fmul contract float %50, %54
  %56 = fadd contract float %45, %55
  %57 = add nuw nsw i32 %44, 1
  %58 = add i32 %46, 1
  %59 = icmp eq i32 %58, %34
  br i1 %59, label %60, label %43, !llvm.loop !11

60:                                               ; preds = %38, %43, %29
  %61 = phi float [ 0.000000e+00, %29 ], [ %39, %38 ], [ %56, %43 ]
  %62 = mul nsw i32 %17, %4
  %63 = add nsw i32 %62, %25
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %6, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = fmul contract float %61, %5
  %68 = sitofp i32 %3 to float
  %69 = fdiv contract float %67, %68
  %70 = fsub contract float %66, %69
  store float %70, float addrspace(1)* %65, align 4, !tbaa !7
  %71 = icmp eq i32 %25, 0
  br i1 %71, label %72, label %252

72:                                               ; preds = %60
  br i1 %30, label %73, label %190

73:                                               ; preds = %72
  %74 = mul nsw i32 %17, %3
  %75 = and i32 %3, 7
  %76 = icmp ult i32 %3, 8
  br i1 %76, label %173, label %77

77:                                               ; preds = %73
  %78 = and i32 %3, -8
  br label %198

79:                                               ; preds = %79, %36
  %80 = phi i32 [ 0, %36 ], [ %170, %79 ]
  %81 = phi float [ 0.000000e+00, %36 ], [ %169, %79 ]
  %82 = phi i32 [ 0, %36 ], [ %171, %79 ]
  %83 = add nsw i32 %80, %32
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !5
  %87 = add nsw i32 %80, %33
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = fmul contract float %86, %90
  %92 = fadd contract float %81, %91
  %93 = or i32 %80, 1
  %94 = add nsw i32 %93, %32
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = add nsw i32 %93, %33
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = fmul contract float %97, %101
  %103 = fadd contract float %92, %102
  %104 = or i32 %80, 2
  %105 = add nsw i32 %104, %32
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !5
  %109 = add nsw i32 %104, %33
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !5
  %113 = fmul contract float %108, %112
  %114 = fadd contract float %103, %113
  %115 = or i32 %80, 3
  %116 = add nsw i32 %115, %32
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !5
  %120 = add nsw i32 %115, %33
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %1, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !7, !amdgpu.noclobber !5
  %124 = fmul contract float %119, %123
  %125 = fadd contract float %114, %124
  %126 = or i32 %80, 4
  %127 = add nsw i32 %126, %32
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = add nsw i32 %126, %33
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7, !amdgpu.noclobber !5
  %135 = fmul contract float %130, %134
  %136 = fadd contract float %125, %135
  %137 = or i32 %80, 5
  %138 = add nsw i32 %137, %32
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %0, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7, !amdgpu.noclobber !5
  %142 = add nsw i32 %137, %33
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %1, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7, !amdgpu.noclobber !5
  %146 = fmul contract float %141, %145
  %147 = fadd contract float %136, %146
  %148 = or i32 %80, 6
  %149 = add nsw i32 %148, %32
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %0, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7, !amdgpu.noclobber !5
  %153 = add nsw i32 %148, %33
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %1, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7, !amdgpu.noclobber !5
  %157 = fmul contract float %152, %156
  %158 = fadd contract float %147, %157
  %159 = or i32 %80, 7
  %160 = add nsw i32 %159, %32
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %0, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7, !amdgpu.noclobber !5
  %164 = add nsw i32 %159, %33
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %1, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !7, !amdgpu.noclobber !5
  %168 = fmul contract float %163, %167
  %169 = fadd contract float %158, %168
  %170 = add nuw nsw i32 %80, 8
  %171 = add i32 %82, 8
  %172 = icmp eq i32 %171, %37
  br i1 %172, label %38, label %79, !llvm.loop !13

173:                                              ; preds = %198, %73
  %174 = phi float [ undef, %73 ], [ %248, %198 ]
  %175 = phi i32 [ 0, %73 ], [ %249, %198 ]
  %176 = phi float [ 0.000000e+00, %73 ], [ %248, %198 ]
  %177 = icmp eq i32 %75, 0
  br i1 %177, label %190, label %178

178:                                              ; preds = %173, %178
  %179 = phi i32 [ %187, %178 ], [ %175, %173 ]
  %180 = phi float [ %186, %178 ], [ %176, %173 ]
  %181 = phi i32 [ %188, %178 ], [ 0, %173 ]
  %182 = add nsw i32 %179, %74
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %0, i64 %183
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !7
  %186 = fadd contract float %180, %185
  %187 = add nuw nsw i32 %179, 1
  %188 = add i32 %181, 1
  %189 = icmp eq i32 %188, %75
  br i1 %189, label %190, label %178, !llvm.loop !15

190:                                              ; preds = %173, %178, %72
  %191 = phi float [ 0.000000e+00, %72 ], [ %174, %173 ], [ %186, %178 ]
  %192 = sext i32 %17 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %7, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !7
  %195 = fmul contract float %191, %5
  %196 = fdiv contract float %195, %68
  %197 = fsub contract float %194, %196
  store float %197, float addrspace(1)* %193, align 4, !tbaa !7
  br label %252

198:                                              ; preds = %198, %77
  %199 = phi i32 [ 0, %77 ], [ %249, %198 ]
  %200 = phi float [ 0.000000e+00, %77 ], [ %248, %198 ]
  %201 = phi i32 [ 0, %77 ], [ %250, %198 ]
  %202 = add nsw i32 %199, %74
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds float, float addrspace(1)* %0, i64 %203
  %205 = load float, float addrspace(1)* %204, align 4, !tbaa !7
  %206 = fadd contract float %200, %205
  %207 = or i32 %199, 1
  %208 = add nsw i32 %207, %74
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds float, float addrspace(1)* %0, i64 %209
  %211 = load float, float addrspace(1)* %210, align 4, !tbaa !7
  %212 = fadd contract float %206, %211
  %213 = or i32 %199, 2
  %214 = add nsw i32 %213, %74
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %0, i64 %215
  %217 = load float, float addrspace(1)* %216, align 4, !tbaa !7
  %218 = fadd contract float %212, %217
  %219 = or i32 %199, 3
  %220 = add nsw i32 %219, %74
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %0, i64 %221
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !7
  %224 = fadd contract float %218, %223
  %225 = or i32 %199, 4
  %226 = add nsw i32 %225, %74
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds float, float addrspace(1)* %0, i64 %227
  %229 = load float, float addrspace(1)* %228, align 4, !tbaa !7
  %230 = fadd contract float %224, %229
  %231 = or i32 %199, 5
  %232 = add nsw i32 %231, %74
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %0, i64 %233
  %235 = load float, float addrspace(1)* %234, align 4, !tbaa !7
  %236 = fadd contract float %230, %235
  %237 = or i32 %199, 6
  %238 = add nsw i32 %237, %74
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds float, float addrspace(1)* %0, i64 %239
  %241 = load float, float addrspace(1)* %240, align 4, !tbaa !7
  %242 = fadd contract float %236, %241
  %243 = or i32 %199, 7
  %244 = add nsw i32 %243, %74
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds float, float addrspace(1)* %0, i64 %245
  %247 = load float, float addrspace(1)* %246, align 4, !tbaa !7
  %248 = fadd contract float %242, %247
  %249 = add nuw nsw i32 %199, 8
  %250 = add i32 %201, 8
  %251 = icmp eq i32 %250, %78
  br i1 %251, label %173, label %198, !llvm.loop !16

252:                                              ; preds = %60, %190, %8
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
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
