; ModuleID = '../data/hip_kernels/10194/20/main.cu'
source_filename = "../data/hip_kernels/10194/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15variance_kernelPfS_iiiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = mul nsw i32 %4, %2
  %8 = add nsw i32 %7, -1
  %9 = sitofp i32 %8 to double
  %10 = fdiv contract double 1.000000e+00, %9
  %11 = fptrunc double %10 to float
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !4
  %18 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !13, !invariant.load !14
  %21 = zext i16 %20 to i32
  %22 = udiv i32 %17, %21
  %23 = mul i32 %22, %21
  %24 = icmp ugt i32 %17, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %13
  %28 = add i32 %27, %12
  %29 = mul i32 %28, %21
  %30 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %31 = add i32 %29, %30
  %32 = icmp slt i32 %31, %3
  br i1 %32, label %33, label %218

33:                                               ; preds = %6
  %34 = sext i32 %31 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %5, i64 %34
  store float 0.000000e+00, float addrspace(1)* %35, align 4, !tbaa !16
  %36 = icmp sgt i32 %2, 0
  br i1 %36, label %37, label %215

37:                                               ; preds = %33
  %38 = icmp sgt i32 %4, 0
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  br label %40

40:                                               ; preds = %37, %211
  %41 = phi float [ 0.000000e+00, %37 ], [ %212, %211 ]
  %42 = phi i32 [ 0, %37 ], [ %213, %211 ]
  br i1 %38, label %43, label %211

43:                                               ; preds = %40
  %44 = mul nsw i32 %42, %3
  %45 = add i32 %44, %31
  %46 = mul i32 %45, %4
  br label %47

47:                                               ; preds = %43, %47
  %48 = phi i32 [ 0, %43 ], [ %209, %47 ]
  %49 = add nsw i32 %48, %46
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !16
  %53 = load float, float addrspace(1)* %39, align 4, !tbaa !16
  %54 = fsub contract float %52, %53
  %55 = tail call float @llvm.fabs.f32(float %54)
  %56 = tail call float @llvm.amdgcn.frexp.mant.f32(float %55)
  %57 = fcmp olt float %56, 0x3FE5555560000000
  %58 = zext i1 %57 to i32
  %59 = tail call float @llvm.amdgcn.ldexp.f32(float %56, i32 %58)
  %60 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %55)
  %61 = sub nsw i32 %60, %58
  %62 = fadd float %59, -1.000000e+00
  %63 = fadd float %59, 1.000000e+00
  %64 = fadd float %63, -1.000000e+00
  %65 = fsub float %59, %64
  %66 = tail call float @llvm.amdgcn.rcp.f32(float %63)
  %67 = fmul float %62, %66
  %68 = fmul float %63, %67
  %69 = fneg float %68
  %70 = tail call float @llvm.fma.f32(float %67, float %63, float %69)
  %71 = tail call float @llvm.fma.f32(float %67, float %65, float %70)
  %72 = fadd float %68, %71
  %73 = fsub float %72, %68
  %74 = fsub float %71, %73
  %75 = fsub float %62, %72
  %76 = fsub float %62, %75
  %77 = fsub float %76, %72
  %78 = fsub float %77, %74
  %79 = fadd float %75, %78
  %80 = fmul float %66, %79
  %81 = fadd float %67, %80
  %82 = fsub float %81, %67
  %83 = fsub float %80, %82
  %84 = fmul float %81, %81
  %85 = fneg float %84
  %86 = tail call float @llvm.fma.f32(float %81, float %81, float %85)
  %87 = fmul float %83, 2.000000e+00
  %88 = tail call float @llvm.fma.f32(float %81, float %87, float %86)
  %89 = fadd float %84, %88
  %90 = fsub float %89, %84
  %91 = fsub float %88, %90
  %92 = tail call float @llvm.fmuladd.f32(float %89, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %93 = tail call float @llvm.fmuladd.f32(float %89, float %92, float 0x3FD999BDE0000000)
  %94 = sitofp i32 %61 to float
  %95 = fmul float %94, 0x3FE62E4300000000
  %96 = fneg float %95
  %97 = tail call float @llvm.fma.f32(float %94, float 0x3FE62E4300000000, float %96)
  %98 = tail call float @llvm.fma.f32(float %94, float 0xBE205C6100000000, float %97)
  %99 = fadd float %95, %98
  %100 = fsub float %99, %95
  %101 = fsub float %98, %100
  %102 = tail call float @llvm.amdgcn.ldexp.f32(float %81, i32 1)
  %103 = fmul float %81, %89
  %104 = fneg float %103
  %105 = tail call float @llvm.fma.f32(float %89, float %81, float %104)
  %106 = tail call float @llvm.fma.f32(float %89, float %83, float %105)
  %107 = tail call float @llvm.fma.f32(float %91, float %81, float %106)
  %108 = fadd float %103, %107
  %109 = fsub float %108, %103
  %110 = fsub float %107, %109
  %111 = fmul float %89, %93
  %112 = fneg float %111
  %113 = tail call float @llvm.fma.f32(float %89, float %93, float %112)
  %114 = tail call float @llvm.fma.f32(float %91, float %93, float %113)
  %115 = fadd float %111, %114
  %116 = fsub float %115, %111
  %117 = fsub float %114, %116
  %118 = fadd float %115, 0x3FE5555540000000
  %119 = fadd float %118, 0xBFE5555540000000
  %120 = fsub float %115, %119
  %121 = fadd float %117, 0x3E2E720200000000
  %122 = fadd float %121, %120
  %123 = fadd float %118, %122
  %124 = fsub float %123, %118
  %125 = fsub float %122, %124
  %126 = fmul float %108, %123
  %127 = fneg float %126
  %128 = tail call float @llvm.fma.f32(float %108, float %123, float %127)
  %129 = tail call float @llvm.fma.f32(float %108, float %125, float %128)
  %130 = tail call float @llvm.fma.f32(float %110, float %123, float %129)
  %131 = tail call float @llvm.amdgcn.ldexp.f32(float %83, i32 1)
  %132 = fadd float %126, %130
  %133 = fsub float %132, %126
  %134 = fsub float %130, %133
  %135 = fadd float %102, %132
  %136 = fsub float %135, %102
  %137 = fsub float %132, %136
  %138 = fadd float %131, %134
  %139 = fadd float %138, %137
  %140 = fadd float %135, %139
  %141 = fsub float %140, %135
  %142 = fsub float %139, %141
  %143 = fadd float %99, %140
  %144 = fsub float %143, %99
  %145 = fsub float %143, %144
  %146 = fsub float %99, %145
  %147 = fsub float %140, %144
  %148 = fadd float %147, %146
  %149 = fadd float %101, %142
  %150 = fsub float %149, %101
  %151 = fsub float %149, %150
  %152 = fsub float %101, %151
  %153 = fsub float %142, %150
  %154 = fadd float %153, %152
  %155 = fadd float %149, %148
  %156 = fadd float %143, %155
  %157 = fsub float %156, %143
  %158 = fsub float %155, %157
  %159 = fadd float %154, %158
  %160 = fadd float %156, %159
  %161 = fsub float %160, %156
  %162 = fsub float %159, %161
  %163 = fmul float %160, 2.000000e+00
  %164 = fneg float %163
  %165 = tail call float @llvm.fma.f32(float %160, float 2.000000e+00, float %164)
  %166 = fmul float %160, 0.000000e+00
  %167 = tail call float @llvm.fma.f32(float %162, float 2.000000e+00, float %166)
  %168 = fadd float %165, %167
  %169 = fadd float %163, %168
  %170 = fsub float %169, %163
  %171 = fsub float %168, %170
  %172 = tail call float @llvm.fabs.f32(float %163) #3
  %173 = fcmp oeq float %172, 0x7FF0000000000000
  %174 = select i1 %173, float %163, float %169
  %175 = tail call float @llvm.fabs.f32(float %174) #3
  %176 = fcmp oeq float %175, 0x7FF0000000000000
  %177 = select i1 %176, float 0.000000e+00, float %171
  %178 = fcmp oeq float %174, 0x40562E4300000000
  %179 = select i1 %178, float 0x3EE0000000000000, float 0.000000e+00
  %180 = fsub float %174, %179
  %181 = fadd float %179, %177
  %182 = fmul float %180, 0x3FF7154760000000
  %183 = tail call float @llvm.rint.f32(float %182)
  %184 = fcmp ogt float %180, 0x40562E4300000000
  %185 = fcmp olt float %180, 0xC059D1DA00000000
  %186 = fneg float %182
  %187 = tail call float @llvm.fma.f32(float %180, float 0x3FF7154760000000, float %186)
  %188 = tail call float @llvm.fma.f32(float %180, float 0x3E54AE0BE0000000, float %187)
  %189 = fsub float %182, %183
  %190 = fadd float %188, %189
  %191 = tail call float @llvm.exp2.f32(float %190)
  %192 = fptosi float %183 to i32
  %193 = tail call float @llvm.amdgcn.ldexp.f32(float %191, i32 %192)
  %194 = select i1 %185, float 0.000000e+00, float %193
  %195 = select i1 %184, float 0x7FF0000000000000, float %194
  %196 = tail call float @llvm.fma.f32(float %195, float %181, float %195)
  %197 = tail call float @llvm.fabs.f32(float %195) #3
  %198 = fcmp oeq float %197, 0x7FF0000000000000
  %199 = select i1 %198, float %195, float %196
  %200 = tail call float @llvm.fabs.f32(float %199)
  %201 = fcmp oeq float %55, 0x7FF0000000000000
  %202 = fcmp oeq float %54, 0.000000e+00
  %203 = select i1 %201, float 0x7FF0000000000000, float %200
  %204 = select i1 %202, float 0.000000e+00, float %203
  %205 = fcmp uno float %54, 0.000000e+00
  %206 = select i1 %205, float 0x7FF8000000000000, float %204
  %207 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %208 = fadd contract float %207, %206
  store float %208, float addrspace(1)* %35, align 4, !tbaa !16
  %209 = add nuw nsw i32 %48, 1
  %210 = icmp eq i32 %209, %4
  br i1 %210, label %211, label %47, !llvm.loop !20

211:                                              ; preds = %47, %40
  %212 = phi float [ %41, %40 ], [ %208, %47 ]
  %213 = add nuw nsw i32 %42, 1
  %214 = icmp eq i32 %213, %2
  br i1 %214, label %215, label %40, !llvm.loop !22

215:                                              ; preds = %211, %33
  %216 = phi float [ 0.000000e+00, %33 ], [ %212, %211 ]
  %217 = fmul contract float %216, %11
  store float %217, float addrspace(1)* %35, align 4, !tbaa !16
  br label %218

218:                                              ; preds = %6, %215
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
