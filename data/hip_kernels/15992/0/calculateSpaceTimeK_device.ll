; ModuleID = '../data/hip_kernels/15992/0/main.cu'
source_filename = "../data/hip_kernels/15992/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.spacePoint = type { float, float, float }
%struct.blackHole = type { float, float, float }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19calculateSpaceTimeKP10spacePointiiffffP9blackHolei(%struct.spacePoint addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, float %3, float %4, float %5, float %6, %struct.blackHole addrspace(1)* nocapture readonly %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = add i32 %17, %10
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !5, !invariant.load !6
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = add i32 %25, %19
  %27 = icmp slt i32 %18, %1
  %28 = icmp slt i32 %26, %2
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %247

30:                                               ; preds = %9
  %31 = sitofp i32 %18 to float
  %32 = sitofp i32 %1 to float
  %33 = fdiv contract float %31, %32
  %34 = fsub contract float %4, %3
  %35 = fmul contract float %34, %33
  %36 = fadd contract float %35, %3
  %37 = sitofp i32 %26 to float
  %38 = sitofp i32 %2 to float
  %39 = fdiv contract float %37, %38
  %40 = fsub contract float %5, %6
  %41 = fmul contract float %40, %39
  %42 = fadd contract float %41, %6
  %43 = mul nsw i32 %18, %1
  %44 = add nsw i32 %43, %26
  %45 = icmp sgt i32 %8, 0
  br i1 %45, label %52, label %46

46:                                               ; preds = %52, %30
  %47 = phi float [ 0.000000e+00, %30 ], [ %244, %52 ]
  %48 = sext i32 %44 to i64
  %49 = getelementptr inbounds %struct.spacePoint, %struct.spacePoint addrspace(1)* %0, i64 %48, i32 0
  store float %36, float addrspace(1)* %49, align 4, !tbaa !7
  %50 = getelementptr inbounds %struct.spacePoint, %struct.spacePoint addrspace(1)* %0, i64 %48, i32 1
  store float %42, float addrspace(1)* %50, align 4, !tbaa !12
  %51 = getelementptr inbounds %struct.spacePoint, %struct.spacePoint addrspace(1)* %0, i64 %48, i32 2
  store float %47, float addrspace(1)* %51, align 4, !tbaa !13
  br label %247

52:                                               ; preds = %30, %52
  %53 = phi float [ %244, %52 ], [ 0.000000e+00, %30 ]
  %54 = phi i32 [ %245, %52 ], [ 0, %30 ]
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds %struct.blackHole, %struct.blackHole addrspace(1)* %7, i64 %55, i32 0
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !14, !amdgpu.noclobber !6
  %58 = fsub contract float %36, %57
  %59 = getelementptr inbounds %struct.blackHole, %struct.blackHole addrspace(1)* %7, i64 %55, i32 1
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !16, !amdgpu.noclobber !6
  %61 = fsub contract float %42, %60
  %62 = fmul contract float %58, %58
  %63 = fmul contract float %61, %61
  %64 = fadd contract float %62, %63
  %65 = fcmp olt float %64, 0x39F0000000000000
  %66 = select i1 %65, float 0x41F0000000000000, float 1.000000e+00
  %67 = fmul float %64, %66
  %68 = tail call float @llvm.sqrt.f32(float %67)
  %69 = bitcast float %68 to i32
  %70 = add nsw i32 %69, -1
  %71 = bitcast i32 %70 to float
  %72 = add nsw i32 %69, 1
  %73 = bitcast i32 %72 to float
  %74 = tail call i1 @llvm.amdgcn.class.f32(float %67, i32 608)
  %75 = select i1 %65, float 0x3EF0000000000000, float 1.000000e+00
  %76 = fneg float %73
  %77 = tail call float @llvm.fma.f32(float %76, float %68, float %67)
  %78 = fcmp ogt float %77, 0.000000e+00
  %79 = fneg float %71
  %80 = tail call float @llvm.fma.f32(float %79, float %68, float %67)
  %81 = fcmp ole float %80, 0.000000e+00
  %82 = select i1 %81, float %71, float %68
  %83 = select i1 %78, float %73, float %82
  %84 = fmul float %75, %83
  %85 = select i1 %74, float %67, float %84
  %86 = fcmp contract oeq float %85, 0.000000e+00
  %87 = select i1 %86, float 0x3E112E0BE0000000, float %85
  %88 = tail call float @llvm.fabs.f32(float %87)
  %89 = tail call float @llvm.amdgcn.frexp.mant.f32(float %88)
  %90 = fcmp olt float %89, 0x3FE5555560000000
  %91 = zext i1 %90 to i32
  %92 = tail call float @llvm.amdgcn.ldexp.f32(float %89, i32 %91)
  %93 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %88)
  %94 = sub nsw i32 %93, %91
  %95 = fadd float %92, -1.000000e+00
  %96 = fadd float %92, 1.000000e+00
  %97 = fadd float %96, -1.000000e+00
  %98 = fsub float %92, %97
  %99 = tail call float @llvm.amdgcn.rcp.f32(float %96)
  %100 = fmul float %95, %99
  %101 = fmul float %96, %100
  %102 = fneg float %101
  %103 = tail call float @llvm.fma.f32(float %100, float %96, float %102)
  %104 = tail call float @llvm.fma.f32(float %100, float %98, float %103)
  %105 = fadd float %101, %104
  %106 = fsub float %105, %101
  %107 = fsub float %104, %106
  %108 = fsub float %95, %105
  %109 = fsub float %95, %108
  %110 = fsub float %109, %105
  %111 = fsub float %110, %107
  %112 = fadd float %108, %111
  %113 = fmul float %99, %112
  %114 = fadd float %100, %113
  %115 = fsub float %114, %100
  %116 = fsub float %113, %115
  %117 = fmul float %114, %114
  %118 = fneg float %117
  %119 = tail call float @llvm.fma.f32(float %114, float %114, float %118)
  %120 = fmul float %116, 2.000000e+00
  %121 = tail call float @llvm.fma.f32(float %114, float %120, float %119)
  %122 = fadd float %117, %121
  %123 = fsub float %122, %117
  %124 = fsub float %121, %123
  %125 = tail call float @llvm.fmuladd.f32(float %122, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %126 = tail call float @llvm.fmuladd.f32(float %122, float %125, float 0x3FD999BDE0000000)
  %127 = sitofp i32 %94 to float
  %128 = fmul float %127, 0x3FE62E4300000000
  %129 = fneg float %128
  %130 = tail call float @llvm.fma.f32(float %127, float 0x3FE62E4300000000, float %129)
  %131 = tail call float @llvm.fma.f32(float %127, float 0xBE205C6100000000, float %130)
  %132 = fadd float %128, %131
  %133 = fsub float %132, %128
  %134 = fsub float %131, %133
  %135 = tail call float @llvm.amdgcn.ldexp.f32(float %114, i32 1)
  %136 = fmul float %114, %122
  %137 = fneg float %136
  %138 = tail call float @llvm.fma.f32(float %122, float %114, float %137)
  %139 = tail call float @llvm.fma.f32(float %122, float %116, float %138)
  %140 = tail call float @llvm.fma.f32(float %124, float %114, float %139)
  %141 = fadd float %136, %140
  %142 = fsub float %141, %136
  %143 = fsub float %140, %142
  %144 = fmul float %122, %126
  %145 = fneg float %144
  %146 = tail call float @llvm.fma.f32(float %122, float %126, float %145)
  %147 = tail call float @llvm.fma.f32(float %124, float %126, float %146)
  %148 = fadd float %144, %147
  %149 = fsub float %148, %144
  %150 = fsub float %147, %149
  %151 = fadd float %148, 0x3FE5555540000000
  %152 = fadd float %151, 0xBFE5555540000000
  %153 = fsub float %148, %152
  %154 = fadd float %150, 0x3E2E720200000000
  %155 = fadd float %154, %153
  %156 = fadd float %151, %155
  %157 = fsub float %156, %151
  %158 = fsub float %155, %157
  %159 = fmul float %141, %156
  %160 = fneg float %159
  %161 = tail call float @llvm.fma.f32(float %141, float %156, float %160)
  %162 = tail call float @llvm.fma.f32(float %141, float %158, float %161)
  %163 = tail call float @llvm.fma.f32(float %143, float %156, float %162)
  %164 = tail call float @llvm.amdgcn.ldexp.f32(float %116, i32 1)
  %165 = fadd float %159, %163
  %166 = fsub float %165, %159
  %167 = fsub float %163, %166
  %168 = fadd float %135, %165
  %169 = fsub float %168, %135
  %170 = fsub float %165, %169
  %171 = fadd float %164, %167
  %172 = fadd float %171, %170
  %173 = fadd float %168, %172
  %174 = fsub float %173, %168
  %175 = fsub float %172, %174
  %176 = fadd float %132, %173
  %177 = fsub float %176, %132
  %178 = fsub float %176, %177
  %179 = fsub float %132, %178
  %180 = fsub float %173, %177
  %181 = fadd float %180, %179
  %182 = fadd float %134, %175
  %183 = fsub float %182, %134
  %184 = fsub float %182, %183
  %185 = fsub float %134, %184
  %186 = fsub float %175, %183
  %187 = fadd float %186, %185
  %188 = fadd float %182, %181
  %189 = fadd float %176, %188
  %190 = fsub float %189, %176
  %191 = fsub float %188, %190
  %192 = fadd float %187, %191
  %193 = fadd float %189, %192
  %194 = fsub float %193, %189
  %195 = fsub float %192, %194
  %196 = fmul float %193, 0x3FA99999A0000000
  %197 = fneg float %196
  %198 = tail call float @llvm.fma.f32(float %193, float 0x3FA99999A0000000, float %197)
  %199 = tail call float @llvm.fma.f32(float %195, float 0x3FA99999A0000000, float %198)
  %200 = fadd float %196, %199
  %201 = fsub float %200, %196
  %202 = fsub float %199, %201
  %203 = tail call float @llvm.fabs.f32(float %196) #3
  %204 = fcmp oeq float %203, 0x7FF0000000000000
  %205 = select i1 %204, float %196, float %200
  %206 = tail call float @llvm.fabs.f32(float %205) #3
  %207 = fcmp oeq float %206, 0x7FF0000000000000
  %208 = select i1 %207, float 0.000000e+00, float %202
  %209 = fcmp oeq float %205, 0x40562E4300000000
  %210 = select i1 %209, float 0x3EE0000000000000, float 0.000000e+00
  %211 = fsub float %205, %210
  %212 = fadd float %210, %208
  %213 = fmul float %211, 0x3FF7154760000000
  %214 = tail call float @llvm.rint.f32(float %213)
  %215 = fcmp ogt float %211, 0x40562E4300000000
  %216 = fcmp olt float %211, 0xC059D1DA00000000
  %217 = fneg float %213
  %218 = tail call float @llvm.fma.f32(float %211, float 0x3FF7154760000000, float %217)
  %219 = tail call float @llvm.fma.f32(float %211, float 0x3E54AE0BE0000000, float %218)
  %220 = fsub float %213, %214
  %221 = fadd float %219, %220
  %222 = tail call float @llvm.exp2.f32(float %221)
  %223 = fptosi float %214 to i32
  %224 = tail call float @llvm.amdgcn.ldexp.f32(float %222, i32 %223)
  %225 = select i1 %216, float 0.000000e+00, float %224
  %226 = select i1 %215, float 0x7FF0000000000000, float %225
  %227 = tail call float @llvm.fma.f32(float %226, float %212, float %226)
  %228 = tail call float @llvm.fabs.f32(float %226) #3
  %229 = fcmp oeq float %228, 0x7FF0000000000000
  %230 = select i1 %229, float %226, float %227
  %231 = fcmp uge float %87, 0.000000e+00
  %232 = tail call float @llvm.fabs.f32(float %230)
  %233 = fcmp oeq float %88, 0x7FF0000000000000
  %234 = fcmp uno float %87, 0.000000e+00
  %235 = fcmp oeq float %87, 1.000000e+00
  %236 = fdiv contract float 1.000000e+00, %232
  %237 = select i1 %231, float %236, float 0x7FF8000000000000
  %238 = select i1 %233, float 0.000000e+00, float %237
  %239 = select i1 %234, float 0x7FF8000000000000, float %238
  %240 = select i1 %235, float 1.000000e+00, float %239
  %241 = getelementptr inbounds %struct.blackHole, %struct.blackHole addrspace(1)* %7, i64 %55, i32 2
  %242 = load float, float addrspace(1)* %241, align 4, !tbaa !17, !amdgpu.noclobber !6
  %243 = fmul contract float %242, %240
  %244 = fadd contract float %53, %243
  %245 = add nuw nsw i32 %54, 1
  %246 = icmp eq i32 %245, %8
  br i1 %246, label %46, label %52, !llvm.loop !18

247:                                              ; preds = %46, %9
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

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
!7 = !{!8, !9, i64 0}
!8 = !{!"_ZTS10spacePoint", !9, i64 0, !9, i64 4, !9, i64 8}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = !{!8, !9, i64 4}
!13 = !{!8, !9, i64 8}
!14 = !{!15, !9, i64 0}
!15 = !{!"_ZTS9blackHole", !9, i64 0, !9, i64 4, !9, i64 8}
!16 = !{!15, !9, i64 4}
!17 = !{!15, !9, i64 8}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.mustprogress"}
