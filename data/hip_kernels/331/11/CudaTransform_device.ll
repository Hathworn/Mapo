; ModuleID = '../data/hip_kernels/331/11/main.cu'
source_filename = "../data/hip_kernels/331/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z13CudaTransformPhPjii(i8 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %6
  %21 = add i32 %20, %5
  %22 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !13, !invariant.load !14
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %26, %27
  %30 = mul i32 %29, %14
  %31 = add i32 %30, %28
  %32 = mul nsw i32 %3, %2
  %33 = icmp ult i32 %31, %32
  br i1 %33, label %34, label %263

34:                                               ; preds = %4
  %35 = tail call double @llvm.amdgcn.rsq.f64(double 2.000000e+00)
  %36 = fmul double %35, 2.000000e+00
  %37 = fmul double %35, 5.000000e-01
  %38 = fneg double %37
  %39 = tail call double @llvm.fma.f64(double %38, double %36, double 5.000000e-01)
  %40 = tail call double @llvm.fma.f64(double %37, double %39, double %37)
  %41 = tail call double @llvm.fma.f64(double %36, double %39, double %36)
  %42 = fneg double %41
  %43 = tail call double @llvm.fma.f64(double %42, double %41, double 2.000000e+00)
  %44 = tail call double @llvm.fma.f64(double %43, double %40, double %41)
  %45 = fneg double %44
  %46 = tail call double @llvm.fma.f64(double %45, double %44, double 2.000000e+00)
  %47 = tail call double @llvm.fma.f64(double %46, double %40, double %44)
  %48 = tail call i32 @llvm.smax.i32(i32 %3, i32 %2)
  %49 = sitofp i32 %48 to float
  %50 = fpext float %49 to double
  %51 = fmul contract double %47, %50
  %52 = fmul contract double %51, 5.000000e-01
  %53 = fptrunc double %52 to float
  %54 = zext i32 %31 to i64
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %54
  %56 = load i8, i8 addrspace(1)* %55, align 1, !tbaa !16, !amdgpu.noclobber !14
  %57 = icmp ugt i8 %56, -6
  br i1 %57, label %58, label %263

58:                                               ; preds = %34
  %59 = freeze i32 %31
  %60 = freeze i32 %2
  %61 = udiv i32 %59, %60
  %62 = mul i32 %61, %60
  %63 = sub i32 %59, %62
  %64 = sdiv i32 %3, 2
  %65 = sitofp i32 %64 to float
  %66 = sdiv i32 %2, 2
  %67 = sitofp i32 %66 to float
  %68 = sitofp i32 %63 to float
  %69 = fsub contract float %68, %67
  %70 = sitofp i32 %61 to float
  %71 = fsub contract float %70, %65
  br label %72

72:                                               ; preds = %58, %232
  %73 = phi i32 [ 0, %58 ], [ %261, %232 ]
  %74 = sitofp i32 %73 to float
  %75 = fmul contract float %74, 0x3F91DF46A0000000
  %76 = tail call float @llvm.fabs.f32(float %75)
  %77 = fcmp olt float %76, 1.310720e+05
  br i1 %77, label %78, label %106

78:                                               ; preds = %72
  %79 = fmul float %76, 0x3FE45F3060000000
  %80 = tail call float @llvm.rint.f32(float %79)
  %81 = tail call float @llvm.fma.f32(float %80, float 0xBFF921FB40000000, float %76)
  %82 = tail call float @llvm.fma.f32(float %80, float 0xBE74442D00000000, float %81)
  %83 = tail call float @llvm.fma.f32(float %80, float 0xBCF8469880000000, float %82)
  %84 = fptosi float %80 to i32
  %85 = fmul float %83, %83
  %86 = tail call float @llvm.fmuladd.f32(float %85, float 0xBF29833040000000, float 0x3F81103880000000)
  %87 = tail call float @llvm.fmuladd.f32(float %85, float %86, float 0xBFC55553A0000000)
  %88 = fmul float %85, %87
  %89 = tail call float @llvm.fmuladd.f32(float %83, float %88, float %83)
  %90 = tail call float @llvm.fmuladd.f32(float %85, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %91 = tail call float @llvm.fmuladd.f32(float %85, float %90, float 0x3FA5557EE0000000)
  %92 = tail call float @llvm.fmuladd.f32(float %85, float %91, float 0xBFE0000080000000)
  %93 = tail call float @llvm.fmuladd.f32(float %85, float %92, float 1.000000e+00)
  %94 = fneg float %89
  %95 = and i32 %84, 1
  %96 = icmp eq i32 %95, 0
  %97 = select i1 %96, float %93, float %94
  %98 = bitcast float %97 to i32
  %99 = shl i32 %84, 30
  %100 = and i32 %99, -2147483648
  %101 = xor i32 %100, %98
  %102 = bitcast i32 %101 to float
  %103 = tail call i1 @llvm.amdgcn.class.f32(float %76, i32 504)
  %104 = select i1 %103, float %102, float 0x7FF8000000000000
  %105 = bitcast float %76 to i32
  br label %232

106:                                              ; preds = %72
  %107 = bitcast float %76 to i32
  %108 = lshr i32 %107, 23
  %109 = and i32 %107, 8388607
  %110 = or i32 %109, 8388608
  %111 = zext i32 %110 to i64
  %112 = mul nuw nsw i64 %111, 4266746795
  %113 = trunc i64 %112 to i32
  %114 = lshr i64 %112, 32
  %115 = mul nuw nsw i64 %111, 1011060801
  %116 = add nuw nsw i64 %114, %115
  %117 = trunc i64 %116 to i32
  %118 = lshr i64 %116, 32
  %119 = mul nuw nsw i64 %111, 3680671129
  %120 = add nuw nsw i64 %118, %119
  %121 = trunc i64 %120 to i32
  %122 = lshr i64 %120, 32
  %123 = mul nuw nsw i64 %111, 4113882560
  %124 = add nuw nsw i64 %122, %123
  %125 = trunc i64 %124 to i32
  %126 = lshr i64 %124, 32
  %127 = mul nuw nsw i64 %111, 4230436817
  %128 = add nuw nsw i64 %126, %127
  %129 = trunc i64 %128 to i32
  %130 = lshr i64 %128, 32
  %131 = mul nuw nsw i64 %111, 1313084713
  %132 = add nuw nsw i64 %130, %131
  %133 = trunc i64 %132 to i32
  %134 = lshr i64 %132, 32
  %135 = mul nuw nsw i64 %111, 2734261102
  %136 = add nuw nsw i64 %134, %135
  %137 = trunc i64 %136 to i32
  %138 = lshr i64 %136, 32
  %139 = trunc i64 %138 to i32
  %140 = add nsw i32 %108, -120
  %141 = icmp ugt i32 %140, 63
  %142 = select i1 %141, i32 %133, i32 %139
  %143 = select i1 %141, i32 %129, i32 %137
  %144 = select i1 %141, i32 %125, i32 %133
  %145 = select i1 %141, i32 %121, i32 %129
  %146 = select i1 %141, i32 %117, i32 %125
  %147 = select i1 %141, i32 %113, i32 %121
  %148 = select i1 %141, i32 -64, i32 0
  %149 = add nsw i32 %148, %140
  %150 = icmp ugt i32 %149, 31
  %151 = select i1 %150, i32 %143, i32 %142
  %152 = select i1 %150, i32 %144, i32 %143
  %153 = select i1 %150, i32 %145, i32 %144
  %154 = select i1 %150, i32 %146, i32 %145
  %155 = select i1 %150, i32 %147, i32 %146
  %156 = select i1 %150, i32 -32, i32 0
  %157 = add nsw i32 %156, %149
  %158 = icmp ugt i32 %157, 31
  %159 = select i1 %158, i32 %152, i32 %151
  %160 = select i1 %158, i32 %153, i32 %152
  %161 = select i1 %158, i32 %154, i32 %153
  %162 = select i1 %158, i32 %155, i32 %154
  %163 = select i1 %158, i32 -32, i32 0
  %164 = add nsw i32 %163, %157
  %165 = icmp eq i32 %164, 0
  %166 = sub nsw i32 32, %164
  %167 = tail call i32 @llvm.fshr.i32(i32 %159, i32 %160, i32 %166)
  %168 = tail call i32 @llvm.fshr.i32(i32 %160, i32 %161, i32 %166)
  %169 = tail call i32 @llvm.fshr.i32(i32 %161, i32 %162, i32 %166)
  %170 = select i1 %165, i32 %159, i32 %167
  %171 = select i1 %165, i32 %160, i32 %168
  %172 = select i1 %165, i32 %161, i32 %169
  %173 = lshr i32 %170, 29
  %174 = tail call i32 @llvm.fshl.i32(i32 %170, i32 %171, i32 2)
  %175 = tail call i32 @llvm.fshl.i32(i32 %171, i32 %172, i32 2)
  %176 = tail call i32 @llvm.fshl.i32(i32 %172, i32 %162, i32 2)
  %177 = and i32 %173, 1
  %178 = sub nsw i32 0, %177
  %179 = shl i32 %173, 31
  %180 = xor i32 %174, %178
  %181 = xor i32 %175, %178
  %182 = xor i32 %176, %178
  %183 = tail call i32 @llvm.ctlz.i32(i32 %180, i1 false), !range !19
  %184 = sub nsw i32 31, %183
  %185 = tail call i32 @llvm.fshr.i32(i32 %180, i32 %181, i32 %184)
  %186 = tail call i32 @llvm.fshr.i32(i32 %181, i32 %182, i32 %184)
  %187 = shl nuw nsw i32 %183, 23
  %188 = sub nuw nsw i32 1056964608, %187
  %189 = lshr i32 %185, 9
  %190 = or i32 %189, %188
  %191 = or i32 %190, %179
  %192 = bitcast i32 %191 to float
  %193 = tail call i32 @llvm.fshl.i32(i32 %185, i32 %186, i32 23)
  %194 = tail call i32 @llvm.ctlz.i32(i32 %193, i1 false), !range !19
  %195 = fmul float %192, 0x3FF921FB40000000
  %196 = add nuw nsw i32 %194, %183
  %197 = shl nuw nsw i32 %196, 23
  %198 = sub nuw nsw i32 855638016, %197
  %199 = sub nsw i32 31, %194
  %200 = tail call i32 @llvm.fshr.i32(i32 %193, i32 %186, i32 %199)
  %201 = lshr i32 %200, 9
  %202 = or i32 %198, %201
  %203 = or i32 %202, %179
  %204 = bitcast i32 %203 to float
  %205 = fneg float %195
  %206 = tail call float @llvm.fma.f32(float %192, float 0x3FF921FB40000000, float %205)
  %207 = tail call float @llvm.fma.f32(float %192, float 0x3E74442D00000000, float %206)
  %208 = tail call float @llvm.fma.f32(float %204, float 0x3FF921FB40000000, float %207)
  %209 = fadd float %195, %208
  %210 = lshr i32 %170, 30
  %211 = add nuw nsw i32 %177, %210
  %212 = fmul float %209, %209
  %213 = tail call float @llvm.fmuladd.f32(float %212, float 0xBF29833040000000, float 0x3F81103880000000)
  %214 = tail call float @llvm.fmuladd.f32(float %212, float %213, float 0xBFC55553A0000000)
  %215 = fmul float %212, %214
  %216 = tail call float @llvm.fmuladd.f32(float %209, float %215, float %209)
  %217 = tail call float @llvm.fmuladd.f32(float %212, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %218 = tail call float @llvm.fmuladd.f32(float %212, float %217, float 0x3FA5557EE0000000)
  %219 = tail call float @llvm.fmuladd.f32(float %212, float %218, float 0xBFE0000080000000)
  %220 = tail call float @llvm.fmuladd.f32(float %212, float %219, float 1.000000e+00)
  %221 = fneg float %216
  %222 = and i32 %211, 1
  %223 = icmp eq i32 %222, 0
  %224 = select i1 %223, float %220, float %221
  %225 = bitcast float %224 to i32
  %226 = shl i32 %211, 30
  %227 = and i32 %226, -2147483648
  %228 = xor i32 %227, %225
  %229 = bitcast i32 %228 to float
  %230 = tail call i1 @llvm.amdgcn.class.f32(float %76, i32 504)
  %231 = select i1 %230, float %229, float 0x7FF8000000000000
  br label %232

232:                                              ; preds = %78, %106
  %233 = phi i32 [ %100, %78 ], [ %227, %106 ]
  %234 = phi i32 [ %95, %78 ], [ %222, %106 ]
  %235 = phi float [ %93, %78 ], [ %220, %106 ]
  %236 = phi float [ %89, %78 ], [ %216, %106 ]
  %237 = phi float [ %104, %78 ], [ %231, %106 ]
  %238 = phi i1 [ %103, %78 ], [ %230, %106 ]
  %239 = phi i32 [ %105, %78 ], [ %107, %106 ]
  %240 = fmul contract float %69, %237
  %241 = icmp eq i32 %234, 0
  %242 = select i1 %241, float %236, float %235
  %243 = bitcast float %242 to i32
  %244 = bitcast float %75 to i32
  %245 = xor i32 %239, %244
  %246 = xor i32 %245, %233
  %247 = xor i32 %246, %243
  %248 = bitcast i32 %247 to float
  %249 = select i1 %238, float %248, float 0x7FF8000000000000
  %250 = fmul contract float %71, %249
  %251 = fadd contract float %240, %250
  %252 = fadd contract float %251, %53
  %253 = tail call float @llvm.round.f32(float %252)
  %254 = fpext float %253 to double
  %255 = fmul contract double %254, 1.800000e+02
  %256 = fptosi double %255 to i32
  %257 = add nsw i32 %73, %256
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %258
  %260 = atomicrmw add i32 addrspace(1)* %259, i32 1 syncscope("agent-one-as") monotonic, align 4
  %261 = add nuw nsw i32 %73, 1
  %262 = icmp eq i32 %261, 180
  br i1 %262, label %263, label %72, !llvm.loop !20

263:                                              ; preds = %232, %34, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.round.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = !{i32 0, i32 33}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
