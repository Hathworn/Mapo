; ModuleID = '../data/hip_kernels/567/9/main.cu'
source_filename = "../data/hip_kernels/567/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ39kernel_array_beam_slave_sincos_originalifffPfS_S_S_iE6tmpsum = internal unnamed_addr addrspace(3) global [1000 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z39kernel_array_beam_slave_sincos_originalifffPfS_S_S_i(i32 %0, float %1, float %2, float %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture writeonly %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = icmp ult i32 %10, %0
  br i1 %11, label %12, label %177

12:                                               ; preds = %9
  %13 = zext i32 %10 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %4, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %16 = fmul contract float %15, %1
  %17 = getelementptr inbounds float, float addrspace(1)* %5, i64 %13
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !5, !amdgpu.noclobber !9
  %19 = fmul contract float %18, %2
  %20 = fadd contract float %16, %19
  %21 = getelementptr inbounds float, float addrspace(1)* %6, i64 %13
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  %23 = fmul contract float %22, %3
  %24 = fadd contract float %20, %23
  %25 = tail call float @llvm.fabs.f32(float %24)
  %26 = fcmp olt float %25, 1.310720e+05
  br i1 %26, label %27, label %35

27:                                               ; preds = %12
  %28 = fmul float %25, 0x3FE45F3060000000
  %29 = tail call float @llvm.rint.f32(float %28)
  %30 = tail call float @llvm.fma.f32(float %29, float 0xBFF921FB40000000, float %25)
  %31 = tail call float @llvm.fma.f32(float %29, float 0xBE74442D00000000, float %30)
  %32 = tail call float @llvm.fma.f32(float %29, float 0xBCF8469880000000, float %31)
  %33 = fptosi float %29 to i32
  %34 = bitcast float %25 to i32
  br label %141

35:                                               ; preds = %12
  %36 = bitcast float %25 to i32
  %37 = lshr i32 %36, 23
  %38 = and i32 %36, 8388607
  %39 = or i32 %38, 8388608
  %40 = zext i32 %39 to i64
  %41 = mul nuw nsw i64 %40, 4266746795
  %42 = trunc i64 %41 to i32
  %43 = lshr i64 %41, 32
  %44 = mul nuw nsw i64 %40, 1011060801
  %45 = add nuw nsw i64 %43, %44
  %46 = trunc i64 %45 to i32
  %47 = lshr i64 %45, 32
  %48 = mul nuw nsw i64 %40, 3680671129
  %49 = add nuw nsw i64 %47, %48
  %50 = trunc i64 %49 to i32
  %51 = lshr i64 %49, 32
  %52 = mul nuw nsw i64 %40, 4113882560
  %53 = add nuw nsw i64 %51, %52
  %54 = trunc i64 %53 to i32
  %55 = lshr i64 %53, 32
  %56 = mul nuw nsw i64 %40, 4230436817
  %57 = add nuw nsw i64 %55, %56
  %58 = trunc i64 %57 to i32
  %59 = lshr i64 %57, 32
  %60 = mul nuw nsw i64 %40, 1313084713
  %61 = add nuw nsw i64 %59, %60
  %62 = trunc i64 %61 to i32
  %63 = lshr i64 %61, 32
  %64 = mul nuw nsw i64 %40, 2734261102
  %65 = add nuw nsw i64 %63, %64
  %66 = trunc i64 %65 to i32
  %67 = lshr i64 %65, 32
  %68 = trunc i64 %67 to i32
  %69 = add nsw i32 %37, -120
  %70 = icmp ugt i32 %69, 63
  %71 = select i1 %70, i32 %62, i32 %68
  %72 = select i1 %70, i32 %58, i32 %66
  %73 = select i1 %70, i32 %54, i32 %62
  %74 = select i1 %70, i32 %50, i32 %58
  %75 = select i1 %70, i32 %46, i32 %54
  %76 = select i1 %70, i32 %42, i32 %50
  %77 = select i1 %70, i32 -64, i32 0
  %78 = add nsw i32 %77, %69
  %79 = icmp ugt i32 %78, 31
  %80 = select i1 %79, i32 %72, i32 %71
  %81 = select i1 %79, i32 %73, i32 %72
  %82 = select i1 %79, i32 %74, i32 %73
  %83 = select i1 %79, i32 %75, i32 %74
  %84 = select i1 %79, i32 %76, i32 %75
  %85 = select i1 %79, i32 -32, i32 0
  %86 = add nsw i32 %85, %78
  %87 = icmp ugt i32 %86, 31
  %88 = select i1 %87, i32 %81, i32 %80
  %89 = select i1 %87, i32 %82, i32 %81
  %90 = select i1 %87, i32 %83, i32 %82
  %91 = select i1 %87, i32 %84, i32 %83
  %92 = select i1 %87, i32 -32, i32 0
  %93 = add nsw i32 %92, %86
  %94 = icmp eq i32 %93, 0
  %95 = sub nsw i32 32, %93
  %96 = tail call i32 @llvm.fshr.i32(i32 %88, i32 %89, i32 %95)
  %97 = tail call i32 @llvm.fshr.i32(i32 %89, i32 %90, i32 %95)
  %98 = tail call i32 @llvm.fshr.i32(i32 %90, i32 %91, i32 %95)
  %99 = select i1 %94, i32 %88, i32 %96
  %100 = select i1 %94, i32 %89, i32 %97
  %101 = select i1 %94, i32 %90, i32 %98
  %102 = lshr i32 %99, 29
  %103 = tail call i32 @llvm.fshl.i32(i32 %99, i32 %100, i32 2)
  %104 = tail call i32 @llvm.fshl.i32(i32 %100, i32 %101, i32 2)
  %105 = tail call i32 @llvm.fshl.i32(i32 %101, i32 %91, i32 2)
  %106 = and i32 %102, 1
  %107 = sub nsw i32 0, %106
  %108 = shl i32 %102, 31
  %109 = xor i32 %103, %107
  %110 = xor i32 %104, %107
  %111 = xor i32 %105, %107
  %112 = tail call i32 @llvm.ctlz.i32(i32 %109, i1 false), !range !10
  %113 = sub nsw i32 31, %112
  %114 = tail call i32 @llvm.fshr.i32(i32 %109, i32 %110, i32 %113)
  %115 = tail call i32 @llvm.fshr.i32(i32 %110, i32 %111, i32 %113)
  %116 = shl nuw nsw i32 %112, 23
  %117 = sub nuw nsw i32 1056964608, %116
  %118 = lshr i32 %114, 9
  %119 = or i32 %118, %117
  %120 = or i32 %119, %108
  %121 = bitcast i32 %120 to float
  %122 = tail call i32 @llvm.fshl.i32(i32 %114, i32 %115, i32 23)
  %123 = tail call i32 @llvm.ctlz.i32(i32 %122, i1 false), !range !10
  %124 = fmul float %121, 0x3FF921FB40000000
  %125 = add nuw nsw i32 %123, %112
  %126 = shl nuw nsw i32 %125, 23
  %127 = sub nuw nsw i32 855638016, %126
  %128 = sub nsw i32 31, %123
  %129 = tail call i32 @llvm.fshr.i32(i32 %122, i32 %115, i32 %128)
  %130 = lshr i32 %129, 9
  %131 = or i32 %127, %130
  %132 = or i32 %131, %108
  %133 = bitcast i32 %132 to float
  %134 = fneg float %124
  %135 = tail call float @llvm.fma.f32(float %121, float 0x3FF921FB40000000, float %134)
  %136 = tail call float @llvm.fma.f32(float %121, float 0x3E74442D00000000, float %135)
  %137 = tail call float @llvm.fma.f32(float %133, float 0x3FF921FB40000000, float %136)
  %138 = fadd float %124, %137
  %139 = lshr i32 %99, 30
  %140 = add nuw nsw i32 %106, %139
  br label %141

141:                                              ; preds = %27, %35
  %142 = phi i32 [ %34, %27 ], [ %36, %35 ]
  %143 = phi float [ %32, %27 ], [ %138, %35 ]
  %144 = phi i32 [ %33, %27 ], [ %140, %35 ]
  %145 = fmul float %143, %143
  %146 = tail call float @llvm.fmuladd.f32(float %145, float 0xBF29833040000000, float 0x3F81103880000000)
  %147 = tail call float @llvm.fmuladd.f32(float %145, float %146, float 0xBFC55553A0000000)
  %148 = fmul float %145, %147
  %149 = tail call float @llvm.fmuladd.f32(float %143, float %148, float %143)
  %150 = tail call float @llvm.fmuladd.f32(float %145, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %151 = tail call float @llvm.fmuladd.f32(float %145, float %150, float 0x3FA5557EE0000000)
  %152 = tail call float @llvm.fmuladd.f32(float %145, float %151, float 0xBFE0000080000000)
  %153 = tail call float @llvm.fmuladd.f32(float %145, float %152, float 1.000000e+00)
  %154 = shl i32 %144, 30
  %155 = and i32 %154, -2147483648
  %156 = and i32 %144, 1
  %157 = icmp eq i32 %156, 0
  %158 = select i1 %157, float %149, float %153
  %159 = bitcast float %158 to i32
  %160 = bitcast float %24 to i32
  %161 = xor i32 %142, %160
  %162 = xor i32 %161, %159
  %163 = xor i32 %162, %155
  %164 = bitcast i32 %163 to float
  %165 = fneg float %149
  %166 = select i1 %157, float %153, float %165
  %167 = bitcast float %166 to i32
  %168 = xor i32 %155, %167
  %169 = bitcast i32 %168 to float
  %170 = tail call i1 @llvm.amdgcn.class.f32(float %25, i32 504)
  %171 = select i1 %170, float %169, float 0x7FF8000000000000
  %172 = select i1 %170, float %164, float 0x7FF8000000000000
  %173 = shl nuw nsw i32 %10, 1
  %174 = getelementptr inbounds [1000 x float], [1000 x float] addrspace(3)* @_ZZ39kernel_array_beam_slave_sincos_originalifffPfS_S_S_iE6tmpsum, i32 0, i32 %173
  store float %172, float addrspace(3)* %174, align 8, !tbaa !5
  %175 = add nuw nsw i32 %173, 1
  %176 = getelementptr inbounds [1000 x float], [1000 x float] addrspace(3)* @_ZZ39kernel_array_beam_slave_sincos_originalifffPfS_S_S_iE6tmpsum, i32 0, i32 %175
  store float %171, float addrspace(3)* %176, align 4, !tbaa !5
  br label %177

177:                                              ; preds = %141, %9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %178 = icmp sgt i32 %8, 1
  br i1 %178, label %179, label %209

179:                                              ; preds = %177
  %180 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %181 = getelementptr i8, i8 addrspace(4)* %180, i64 4
  %182 = bitcast i8 addrspace(4)* %181 to i16 addrspace(4)*
  %183 = shl nuw nsw i32 %10, 1
  %184 = getelementptr inbounds [1000 x float], [1000 x float] addrspace(3)* @_ZZ39kernel_array_beam_slave_sincos_originalifffPfS_S_S_iE6tmpsum, i32 0, i32 %183
  %185 = add nuw nsw i32 %183, 1
  %186 = getelementptr inbounds [1000 x float], [1000 x float] addrspace(3)* @_ZZ39kernel_array_beam_slave_sincos_originalifffPfS_S_S_iE6tmpsum, i32 0, i32 %185
  br label %187

187:                                              ; preds = %179, %207
  %188 = phi i32 [ %8, %179 ], [ %189, %207 ]
  %189 = lshr i32 %188, 1
  %190 = icmp ult i32 %10, %189
  br i1 %190, label %191, label %207

191:                                              ; preds = %187
  %192 = add nuw i32 %189, %10
  %193 = load i16, i16 addrspace(4)* %182, align 4, !range !11, !invariant.load !9
  %194 = zext i16 %193 to i32
  %195 = icmp ult i32 %192, %194
  br i1 %195, label %196, label %207

196:                                              ; preds = %191
  %197 = load float, float addrspace(3)* %184, align 8, !tbaa !5
  %198 = shl nsw i32 %192, 1
  %199 = getelementptr inbounds [1000 x float], [1000 x float] addrspace(3)* @_ZZ39kernel_array_beam_slave_sincos_originalifffPfS_S_S_iE6tmpsum, i32 0, i32 %198
  %200 = load float, float addrspace(3)* %199, align 8, !tbaa !5
  %201 = fadd contract float %197, %200
  store float %201, float addrspace(3)* %184, align 8, !tbaa !5
  %202 = load float, float addrspace(3)* %186, align 4, !tbaa !5
  %203 = add nuw nsw i32 %198, 1
  %204 = getelementptr inbounds [1000 x float], [1000 x float] addrspace(3)* @_ZZ39kernel_array_beam_slave_sincos_originalifffPfS_S_S_iE6tmpsum, i32 0, i32 %203
  %205 = load float, float addrspace(3)* %204, align 4, !tbaa !5
  %206 = fadd contract float %202, %205
  store float %206, float addrspace(3)* %186, align 4, !tbaa !5
  br label %207

207:                                              ; preds = %191, %196, %187
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %208 = icmp ugt i32 %188, 3
  br i1 %208, label %187, label %209, !llvm.loop !12

209:                                              ; preds = %207, %177
  %210 = icmp eq i32 %10, 0
  br i1 %210, label %211, label %215

211:                                              ; preds = %209
  %212 = load float, float addrspace(3)* getelementptr inbounds ([1000 x float], [1000 x float] addrspace(3)* @_ZZ39kernel_array_beam_slave_sincos_originalifffPfS_S_S_iE6tmpsum, i32 0, i32 0), align 16, !tbaa !5
  store float %212, float addrspace(1)* %7, align 4, !tbaa !5
  %213 = load float, float addrspace(3)* getelementptr inbounds ([1000 x float], [1000 x float] addrspace(3)* @_ZZ39kernel_array_beam_slave_sincos_originalifffPfS_S_S_iE6tmpsum, i32 0, i32 1), align 4, !tbaa !5
  %214 = getelementptr inbounds float, float addrspace(1)* %7, i64 1
  store float %213, float addrspace(1)* %214, align 4, !tbaa !5
  br label %215

215:                                              ; preds = %211, %209
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!9 = !{}
!10 = !{i32 0, i32 33}
!11 = !{i16 1, i16 1025}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
