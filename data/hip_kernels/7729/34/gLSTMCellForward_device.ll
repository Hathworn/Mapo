; ModuleID = '../data/hip_kernels/7729/34/main.cu'
source_filename = "../data/hip_kernels/7729/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16gLSTMCellForwardPfPKfS1_S1_S1_S1_mm(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* readonly %5, i64 %6, i64 %7) local_unnamed_addr #0 {
  %9 = icmp eq i64 %6, 0
  br i1 %9, label %29, label %10

10:                                               ; preds = %8
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = icmp eq float addrspace(1)* %5, addrspacecast (float* null to float addrspace(1)*)
  %13 = icmp eq i64 %7, 0
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %15 = trunc i64 %7 to i32
  %16 = shl i32 %15, 1
  %17 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %17, i64 12
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !4
  %23 = load i16, i16 addrspace(4)* %19, align 4, !range !13, !invariant.load !14
  %24 = zext i16 %23 to i32
  %25 = udiv i32 %22, %24
  %26 = mul i32 %25, %24
  %27 = icmp ugt i32 %22, %26
  %28 = zext i1 %27 to i32
  br label %30

29:                                               ; preds = %208, %8
  ret void

30:                                               ; preds = %10, %208
  %31 = phi i32 [ 0, %10 ], [ %210, %208 ]
  %32 = add i32 %31, %11
  %33 = sext i32 %32 to i64
  %34 = icmp ult i64 %33, %6
  br i1 %34, label %35, label %208

35:                                               ; preds = %30
  br i1 %12, label %40, label %36

36:                                               ; preds = %35
  %37 = getelementptr inbounds float, float addrspace(1)* %5, i64 %33
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !15
  %39 = fcmp contract une float %38, 0.000000e+00
  br label %40

40:                                               ; preds = %36, %35
  %41 = phi i1 [ true, %35 ], [ %39, %36 ]
  %42 = uitofp i1 %41 to float
  %43 = mul i64 %33, %7
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %46 = shl i64 %43, 2
  %47 = getelementptr inbounds float, float addrspace(1)* %2, i64 %46
  %48 = getelementptr inbounds float, float addrspace(1)* %3, i64 %46
  br i1 %13, label %208, label %49

49:                                               ; preds = %40
  %50 = fsub contract float 1.000000e+00, %42
  br label %51

51:                                               ; preds = %49, %204
  %52 = phi i32 [ 0, %49 ], [ %205, %204 ]
  %53 = add i32 %52, %14
  %54 = sext i32 %53 to i64
  %55 = icmp ult i64 %54, %7
  br i1 %55, label %56, label %204

56:                                               ; preds = %51
  %57 = getelementptr inbounds float, float addrspace(1)* %47, i64 %54
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !15
  %59 = getelementptr inbounds float, float addrspace(1)* %48, i64 %54
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !15
  %61 = fadd contract float %58, %60
  %62 = getelementptr inbounds float, float addrspace(1)* %4, i64 %54
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !15
  %64 = fadd contract float %61, %63
  %65 = fcmp contract ult float %64, 0.000000e+00
  br i1 %65, label %83, label %66

66:                                               ; preds = %56
  %67 = fneg contract float %64
  %68 = fmul float %64, 0xBFF7154760000000
  %69 = tail call float @llvm.rint.f32(float %68)
  %70 = fcmp olt float %64, 0xC0562E4300000000
  %71 = fcmp ogt float %64, 0x4059D1DA00000000
  %72 = fneg float %68
  %73 = tail call float @llvm.fma.f32(float %67, float 0x3FF7154760000000, float %72)
  %74 = tail call float @llvm.fma.f32(float %67, float 0x3E54AE0BE0000000, float %73)
  %75 = fsub float %68, %69
  %76 = fadd float %74, %75
  %77 = tail call float @llvm.exp2.f32(float %76)
  %78 = fptosi float %69 to i32
  %79 = tail call float @llvm.amdgcn.ldexp.f32(float %77, i32 %78)
  %80 = select i1 %71, float 0.000000e+00, float %79
  %81 = select i1 %70, float 0x7FF0000000000000, float %80
  %82 = fpext float %81 to double
  br label %99

83:                                               ; preds = %56
  %84 = fmul float %64, 0x3FF7154760000000
  %85 = tail call float @llvm.rint.f32(float %84)
  %86 = fcmp ogt float %64, 0x40562E4300000000
  %87 = fcmp olt float %64, 0xC059D1DA00000000
  %88 = fneg float %84
  %89 = tail call float @llvm.fma.f32(float %64, float 0x3FF7154760000000, float %88)
  %90 = tail call float @llvm.fma.f32(float %64, float 0x3E54AE0BE0000000, float %89)
  %91 = fsub float %84, %85
  %92 = fadd float %90, %91
  %93 = tail call float @llvm.exp2.f32(float %92)
  %94 = fptosi float %85 to i32
  %95 = tail call float @llvm.amdgcn.ldexp.f32(float %93, i32 %94)
  %96 = select i1 %87, float 0.000000e+00, float %95
  %97 = select i1 %86, float 0x7FF0000000000000, float %96
  %98 = fpext float %97 to double
  br label %99

99:                                               ; preds = %66, %83
  %100 = phi double [ %98, %83 ], [ %82, %66 ]
  %101 = phi double [ %98, %83 ], [ 1.000000e+00, %66 ]
  %102 = fadd contract double %100, 1.000000e+00
  %103 = fdiv contract double %101, %102
  %104 = fptrunc double %103 to float
  %105 = add i32 %53, %15
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %47, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !15
  %109 = getelementptr inbounds float, float addrspace(1)* %48, i64 %106
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !15
  %111 = fadd contract float %108, %110
  %112 = getelementptr inbounds float, float addrspace(1)* %4, i64 %106
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !15
  %114 = fadd contract float %111, %113
  %115 = fcmp contract ult float %114, 0.000000e+00
  br i1 %115, label %133, label %116

116:                                              ; preds = %99
  %117 = fneg contract float %114
  %118 = fmul float %114, 0xBFF7154760000000
  %119 = tail call float @llvm.rint.f32(float %118)
  %120 = fcmp olt float %114, 0xC0562E4300000000
  %121 = fcmp ogt float %114, 0x4059D1DA00000000
  %122 = fneg float %118
  %123 = tail call float @llvm.fma.f32(float %117, float 0x3FF7154760000000, float %122)
  %124 = tail call float @llvm.fma.f32(float %117, float 0x3E54AE0BE0000000, float %123)
  %125 = fsub float %118, %119
  %126 = fadd float %124, %125
  %127 = tail call float @llvm.exp2.f32(float %126)
  %128 = fptosi float %119 to i32
  %129 = tail call float @llvm.amdgcn.ldexp.f32(float %127, i32 %128)
  %130 = select i1 %121, float 0.000000e+00, float %129
  %131 = select i1 %120, float 0x7FF0000000000000, float %130
  %132 = fpext float %131 to double
  br label %149

133:                                              ; preds = %99
  %134 = fmul float %114, 0x3FF7154760000000
  %135 = tail call float @llvm.rint.f32(float %134)
  %136 = fcmp ogt float %114, 0x40562E4300000000
  %137 = fcmp olt float %114, 0xC059D1DA00000000
  %138 = fneg float %134
  %139 = tail call float @llvm.fma.f32(float %114, float 0x3FF7154760000000, float %138)
  %140 = tail call float @llvm.fma.f32(float %114, float 0x3E54AE0BE0000000, float %139)
  %141 = fsub float %134, %135
  %142 = fadd float %140, %141
  %143 = tail call float @llvm.exp2.f32(float %142)
  %144 = fptosi float %135 to i32
  %145 = tail call float @llvm.amdgcn.ldexp.f32(float %143, i32 %144)
  %146 = select i1 %137, float 0.000000e+00, float %145
  %147 = select i1 %136, float 0x7FF0000000000000, float %146
  %148 = fpext float %147 to double
  br label %149

149:                                              ; preds = %116, %133
  %150 = phi double [ %148, %133 ], [ %132, %116 ]
  %151 = phi double [ %148, %133 ], [ 1.000000e+00, %116 ]
  %152 = fadd contract double %150, 1.000000e+00
  %153 = fdiv contract double %151, %152
  %154 = fptrunc double %153 to float
  %155 = add i32 %53, %16
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %47, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !15
  %159 = getelementptr inbounds float, float addrspace(1)* %48, i64 %156
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !15
  %161 = fadd contract float %158, %160
  %162 = getelementptr inbounds float, float addrspace(1)* %4, i64 %156
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !15
  %164 = fadd contract float %161, %163
  %165 = tail call float @llvm.fabs.f32(float %164)
  %166 = fcmp olt float %165, 6.250000e-01
  br i1 %166, label %167, label %175

167:                                              ; preds = %149
  %168 = fmul float %164, %164
  %169 = tail call float @llvm.fmuladd.f32(float %168, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %170 = tail call float @llvm.fmuladd.f32(float %168, float %169, float 0xBFAB8389C0000000)
  %171 = tail call float @llvm.fmuladd.f32(float %168, float %170, float 0x3FC1107040000000)
  %172 = tail call float @llvm.fmuladd.f32(float %168, float %171, float 0xBFD5555320000000)
  %173 = fmul float %165, %172
  %174 = tail call float @llvm.fmuladd.f32(float %168, float %173, float %165)
  br label %192

175:                                              ; preds = %149
  %176 = fmul float %165, 2.000000e+00
  %177 = fmul float %176, 0x3FF7154760000000
  %178 = tail call float @llvm.rint.f32(float %177)
  %179 = fcmp ogt float %176, 0x40562E4300000000
  %180 = fneg float %177
  %181 = tail call float @llvm.fma.f32(float %176, float 0x3FF7154760000000, float %180)
  %182 = tail call float @llvm.fma.f32(float %176, float 0x3E54AE0BE0000000, float %181)
  %183 = fsub float %177, %178
  %184 = fadd float %182, %183
  %185 = tail call float @llvm.exp2.f32(float %184)
  %186 = fptosi float %178 to i32
  %187 = tail call float @llvm.amdgcn.ldexp.f32(float %185, i32 %186)
  %188 = fadd float %187, 1.000000e+00
  %189 = select i1 %179, float 0x7FF0000000000000, float %188
  %190 = tail call float @llvm.amdgcn.rcp.f32(float %189)
  %191 = tail call float @llvm.fmuladd.f32(float %190, float -2.000000e+00, float 1.000000e+00)
  br label %192

192:                                              ; preds = %167, %175
  %193 = phi float [ %174, %167 ], [ %191, %175 ]
  %194 = tail call float @llvm.copysign.f32(float %193, float %164)
  %195 = getelementptr inbounds float, float addrspace(1)* %45, i64 %54
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !15
  %197 = fmul contract float %196, %104
  %198 = fmul contract float %194, %154
  %199 = fadd contract float %197, %198
  %200 = fmul contract float %199, %42
  %201 = fmul contract float %50, %196
  %202 = fadd contract float %201, %200
  %203 = getelementptr inbounds float, float addrspace(1)* %44, i64 %54
  store float %202, float addrspace(1)* %203, align 4, !tbaa !15
  br label %204

204:                                              ; preds = %192, %51
  %205 = add i32 %52, %24
  %206 = sext i32 %205 to i64
  %207 = icmp ult i64 %206, %7
  br i1 %207, label %51, label %208, !llvm.loop !19

208:                                              ; preds = %204, %40, %30
  %209 = add i32 %25, %31
  %210 = add i32 %209, %28
  %211 = sext i32 %210 to i64
  %212 = icmp ult i64 %211, %6
  br i1 %212, label %30, label %29, !llvm.loop !21
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !20}
