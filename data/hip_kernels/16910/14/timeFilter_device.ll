; ModuleID = '../data/hip_kernels/16910/14/main.cu'
source_filename = "../data/hip_kernels/16910/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10timeFilterPKdPKfS2_PfE2sW = internal addrspace(3) global [243 x float] undef, align 16
@_ZZ10timeFilterPKdPKfS2_PfE5sdata = internal addrspace(3) global [3315 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10timeFilterPKdPKfS2_Pf(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = load double, double addrspace(1)* %0, align 8, !tbaa !5, !amdgpu.noclobber !9
  %8 = fptosi double %7 to i32
  %9 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %10 = load double, double addrspace(1)* %9, align 8, !tbaa !5, !amdgpu.noclobber !9
  %11 = fptosi double %10 to i32
  %12 = getelementptr inbounds double, double addrspace(1)* %0, i64 6
  %13 = load double, double addrspace(1)* %12, align 8, !tbaa !5, !amdgpu.noclobber !9
  %14 = fptosi double %13 to i32
  %15 = freeze i32 %14
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !5, !amdgpu.noclobber !9
  %18 = fptosi double %17 to i32
  %19 = mul nsw i32 %15, %18
  %20 = icmp slt i32 %5, %19
  br i1 %20, label %21, label %33

21:                                               ; preds = %4
  %22 = srem i32 %5, %18
  %23 = sdiv i32 %5, %18
  %24 = mul nsw i32 %23, %11
  %25 = add nsw i32 %24, %6
  %26 = mul nsw i32 %25, %18
  %27 = add nsw i32 %26, %22
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %2, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !10, !amdgpu.noclobber !9
  %31 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ10timeFilterPKdPKfS2_PfE2sW, i32 0, i32 %5
  %32 = addrspacecast float addrspace(3)* %31 to float*
  store volatile float %30, float* %32, align 4, !tbaa !10
  br label %33

33:                                               ; preds = %21, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = add nsw i32 %8, -1024
  %35 = sub i32 %34, %18
  %36 = icmp slt i32 %35, 0
  br i1 %36, label %232, label %37

37:                                               ; preds = %33
  %38 = mul nsw i32 %18, 3
  %39 = icmp slt i32 %5, %38
  %40 = add nsw i32 %18, 1024
  %41 = icmp sgt i32 %15, 0
  %42 = add i32 %5, %18
  %43 = icmp sgt i32 %18, 0
  %44 = mul nsw i32 %6, %8
  %45 = add i32 %44, %5
  %46 = add nsw i32 %15, -1
  %47 = urem i32 %46, 3
  %48 = trunc i32 %47 to i8
  %49 = add nuw nsw i8 %48, 1
  %50 = urem i8 %49, 3
  %51 = zext i8 %50 to i32
  %52 = icmp ult i32 %15, 3
  %53 = sub nuw nsw i32 %15, %51
  %54 = icmp eq i8 %50, 0
  %55 = and i32 %18, 3
  %56 = icmp ult i32 %18, 4
  %57 = and i32 %18, -4
  %58 = icmp eq i32 %55, 0
  br label %59

59:                                               ; preds = %37, %225
  %60 = phi i32 [ 0, %37 ], [ %230, %225 ]
  br i1 %39, label %61, label %79

61:                                               ; preds = %59
  %62 = freeze i32 %5
  %63 = freeze i32 %18
  %64 = sdiv i32 %62, %63
  %65 = mul i32 %64, %63
  %66 = sub i32 %62, %65
  %67 = or i32 %66, %60
  %68 = mul nsw i32 %64, %11
  %69 = add nsw i32 %68, %6
  %70 = mul nsw i32 %69, %8
  %71 = add nsw i32 %67, %70
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !10
  %75 = mul nsw i32 %64, %40
  %76 = add nsw i32 %75, %66
  %77 = getelementptr inbounds [3315 x float], [3315 x float] addrspace(3)* @_ZZ10timeFilterPKdPKfS2_PfE5sdata, i32 0, i32 %76
  %78 = addrspacecast float addrspace(3)* %77 to float*
  store volatile float %74, float* %78, align 4, !tbaa !10
  br label %79

79:                                               ; preds = %61, %59
  br i1 %41, label %80, label %142

80:                                               ; preds = %79
  %81 = add i32 %42, %60
  br i1 %52, label %123, label %82

82:                                               ; preds = %80, %82
  %83 = phi i32 [ %120, %82 ], [ 0, %80 ]
  %84 = phi i32 [ %121, %82 ], [ 0, %80 ]
  %85 = mul nsw i32 %83, %11
  %86 = add nsw i32 %85, %6
  %87 = mul nsw i32 %86, %8
  %88 = add i32 %81, %87
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !10
  %92 = mul nsw i32 %83, %40
  %93 = add nsw i32 %42, %92
  %94 = getelementptr inbounds [3315 x float], [3315 x float] addrspace(3)* @_ZZ10timeFilterPKdPKfS2_PfE5sdata, i32 0, i32 %93
  %95 = addrspacecast float addrspace(3)* %94 to float*
  store volatile float %91, float* %95, align 4, !tbaa !10
  %96 = add nuw nsw i32 %83, 1
  %97 = mul nsw i32 %96, %11
  %98 = add nsw i32 %97, %6
  %99 = mul nsw i32 %98, %8
  %100 = add i32 %81, %99
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !10
  %104 = mul nsw i32 %96, %40
  %105 = add nsw i32 %42, %104
  %106 = getelementptr inbounds [3315 x float], [3315 x float] addrspace(3)* @_ZZ10timeFilterPKdPKfS2_PfE5sdata, i32 0, i32 %105
  %107 = addrspacecast float addrspace(3)* %106 to float*
  store volatile float %103, float* %107, align 4, !tbaa !10
  %108 = add nuw nsw i32 %83, 2
  %109 = mul nsw i32 %108, %11
  %110 = add nsw i32 %109, %6
  %111 = mul nsw i32 %110, %8
  %112 = add i32 %81, %111
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !10
  %116 = mul nsw i32 %108, %40
  %117 = add nsw i32 %42, %116
  %118 = getelementptr inbounds [3315 x float], [3315 x float] addrspace(3)* @_ZZ10timeFilterPKdPKfS2_PfE5sdata, i32 0, i32 %117
  %119 = addrspacecast float addrspace(3)* %118 to float*
  store volatile float %115, float* %119, align 4, !tbaa !10
  %120 = add nuw nsw i32 %83, 3
  %121 = add i32 %84, 3
  %122 = icmp eq i32 %121, %53
  br i1 %122, label %123, label %82, !llvm.loop !12

123:                                              ; preds = %82, %80
  %124 = phi i32 [ 0, %80 ], [ %120, %82 ]
  br i1 %54, label %142, label %125

125:                                              ; preds = %123, %125
  %126 = phi i32 [ %139, %125 ], [ %124, %123 ]
  %127 = phi i32 [ %140, %125 ], [ 0, %123 ]
  %128 = mul nsw i32 %126, %11
  %129 = add nsw i32 %128, %6
  %130 = mul nsw i32 %129, %8
  %131 = add i32 %81, %130
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !10
  %135 = mul nsw i32 %126, %40
  %136 = add nsw i32 %42, %135
  %137 = getelementptr inbounds [3315 x float], [3315 x float] addrspace(3)* @_ZZ10timeFilterPKdPKfS2_PfE5sdata, i32 0, i32 %136
  %138 = addrspacecast float addrspace(3)* %137 to float*
  store volatile float %134, float* %138, align 4, !tbaa !10
  %139 = add nuw nsw i32 %126, 1
  %140 = add nuw i32 %127, 1
  %141 = icmp eq i32 %140, %51
  br i1 %141, label %142, label %125, !llvm.loop !15

142:                                              ; preds = %125, %123, %79
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %41, label %143, label %225

143:                                              ; preds = %142, %221
  %144 = phi float [ %222, %221 ], [ 0.000000e+00, %142 ]
  %145 = phi i32 [ %223, %221 ], [ 0, %142 ]
  br i1 %43, label %146, label %221

146:                                              ; preds = %143
  %147 = mul nsw i32 %145, %18
  %148 = mul nsw i32 %145, %40
  %149 = add i32 %148, %5
  br i1 %56, label %200, label %150

150:                                              ; preds = %146, %150
  %151 = phi float [ %196, %150 ], [ %144, %146 ]
  %152 = phi i32 [ %197, %150 ], [ 0, %146 ]
  %153 = phi i32 [ %198, %150 ], [ 0, %146 ]
  %154 = add nsw i32 %152, %147
  %155 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ10timeFilterPKdPKfS2_PfE2sW, i32 0, i32 %154
  %156 = addrspacecast float addrspace(3)* %155 to float*
  %157 = load volatile float, float* %156, align 4, !tbaa !10
  %158 = add i32 %149, %152
  %159 = getelementptr inbounds [3315 x float], [3315 x float] addrspace(3)* @_ZZ10timeFilterPKdPKfS2_PfE5sdata, i32 0, i32 %158
  %160 = addrspacecast float addrspace(3)* %159 to float*
  %161 = load volatile float, float* %160, align 4, !tbaa !10
  %162 = fmul contract float %157, %161
  %163 = fadd contract float %151, %162
  %164 = or i32 %152, 1
  %165 = add nsw i32 %164, %147
  %166 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ10timeFilterPKdPKfS2_PfE2sW, i32 0, i32 %165
  %167 = addrspacecast float addrspace(3)* %166 to float*
  %168 = load volatile float, float* %167, align 4, !tbaa !10
  %169 = add i32 %149, %164
  %170 = getelementptr inbounds [3315 x float], [3315 x float] addrspace(3)* @_ZZ10timeFilterPKdPKfS2_PfE5sdata, i32 0, i32 %169
  %171 = addrspacecast float addrspace(3)* %170 to float*
  %172 = load volatile float, float* %171, align 4, !tbaa !10
  %173 = fmul contract float %168, %172
  %174 = fadd contract float %163, %173
  %175 = or i32 %152, 2
  %176 = add nsw i32 %175, %147
  %177 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ10timeFilterPKdPKfS2_PfE2sW, i32 0, i32 %176
  %178 = addrspacecast float addrspace(3)* %177 to float*
  %179 = load volatile float, float* %178, align 4, !tbaa !10
  %180 = add i32 %149, %175
  %181 = getelementptr inbounds [3315 x float], [3315 x float] addrspace(3)* @_ZZ10timeFilterPKdPKfS2_PfE5sdata, i32 0, i32 %180
  %182 = addrspacecast float addrspace(3)* %181 to float*
  %183 = load volatile float, float* %182, align 4, !tbaa !10
  %184 = fmul contract float %179, %183
  %185 = fadd contract float %174, %184
  %186 = or i32 %152, 3
  %187 = add nsw i32 %186, %147
  %188 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ10timeFilterPKdPKfS2_PfE2sW, i32 0, i32 %187
  %189 = addrspacecast float addrspace(3)* %188 to float*
  %190 = load volatile float, float* %189, align 4, !tbaa !10
  %191 = add i32 %149, %186
  %192 = getelementptr inbounds [3315 x float], [3315 x float] addrspace(3)* @_ZZ10timeFilterPKdPKfS2_PfE5sdata, i32 0, i32 %191
  %193 = addrspacecast float addrspace(3)* %192 to float*
  %194 = load volatile float, float* %193, align 4, !tbaa !10
  %195 = fmul contract float %190, %194
  %196 = fadd contract float %185, %195
  %197 = add nuw nsw i32 %152, 4
  %198 = add i32 %153, 4
  %199 = icmp eq i32 %198, %57
  br i1 %199, label %200, label %150, !llvm.loop !16

200:                                              ; preds = %150, %146
  %201 = phi float [ undef, %146 ], [ %196, %150 ]
  %202 = phi float [ %144, %146 ], [ %196, %150 ]
  %203 = phi i32 [ 0, %146 ], [ %197, %150 ]
  br i1 %58, label %221, label %204

204:                                              ; preds = %200, %204
  %205 = phi float [ %217, %204 ], [ %202, %200 ]
  %206 = phi i32 [ %218, %204 ], [ %203, %200 ]
  %207 = phi i32 [ %219, %204 ], [ 0, %200 ]
  %208 = add nsw i32 %206, %147
  %209 = getelementptr inbounds [243 x float], [243 x float] addrspace(3)* @_ZZ10timeFilterPKdPKfS2_PfE2sW, i32 0, i32 %208
  %210 = addrspacecast float addrspace(3)* %209 to float*
  %211 = load volatile float, float* %210, align 4, !tbaa !10
  %212 = add i32 %149, %206
  %213 = getelementptr inbounds [3315 x float], [3315 x float] addrspace(3)* @_ZZ10timeFilterPKdPKfS2_PfE5sdata, i32 0, i32 %212
  %214 = addrspacecast float addrspace(3)* %213 to float*
  %215 = load volatile float, float* %214, align 4, !tbaa !10
  %216 = fmul contract float %211, %215
  %217 = fadd contract float %205, %216
  %218 = add nuw nsw i32 %206, 1
  %219 = add nuw nsw i32 %207, 1
  %220 = icmp eq i32 %219, %55
  br i1 %220, label %221, label %204, !llvm.loop !17

221:                                              ; preds = %204, %200, %143
  %222 = phi float [ %144, %143 ], [ %201, %200 ], [ %217, %204 ]
  %223 = add nuw nsw i32 %145, 1
  %224 = icmp eq i32 %223, %15
  br i1 %224, label %225, label %143, !llvm.loop !18

225:                                              ; preds = %221, %142
  %226 = phi float [ 0.000000e+00, %142 ], [ %222, %221 ]
  %227 = add i32 %45, %60
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds float, float addrspace(1)* %3, i64 %228
  store float %226, float addrspace(1)* %229, align 4, !tbaa !10
  %230 = add nuw nsw i32 %60, 1024
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %231 = icmp sgt i32 %230, %35
  br i1 %231, label %232, label %59, !llvm.loop !19

232:                                              ; preds = %225, %33
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !13, !14}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !13}
!19 = distinct !{!19, !13}
