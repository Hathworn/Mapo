; ModuleID = '../data/hip_kernels/9798/38/main.cu'
source_filename = "../data/hip_kernels/9798/38/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @softmax(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = shl i32 %5, 1
  %15 = mul i32 %14, %10
  %16 = add i32 %15, %4
  %17 = shl nuw nsw i32 %10, 1
  %18 = udiv i32 %13, %10
  %19 = mul i32 %18, %10
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %17, %22
  %24 = icmp ult i32 %16, %2
  br i1 %24, label %25, label %71

25:                                               ; preds = %3, %67
  %26 = phi i32 [ %69, %67 ], [ %16, %3 ]
  %27 = phi float [ %68, %67 ], [ 0.000000e+00, %3 ]
  %28 = zext i32 %26 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !16, !amdgpu.noclobber !6
  %31 = fmul float %30, 0x3FF7154760000000
  %32 = tail call float @llvm.rint.f32(float %31)
  %33 = fcmp ogt float %30, 0x40562E4300000000
  %34 = fcmp olt float %30, 0xC059D1DA00000000
  %35 = fneg float %31
  %36 = tail call float @llvm.fma.f32(float %30, float 0x3FF7154760000000, float %35)
  %37 = tail call float @llvm.fma.f32(float %30, float 0x3E54AE0BE0000000, float %36)
  %38 = fsub float %31, %32
  %39 = fadd float %37, %38
  %40 = tail call float @llvm.exp2.f32(float %39)
  %41 = fptosi float %32 to i32
  %42 = tail call float @llvm.amdgcn.ldexp.f32(float %40, i32 %41)
  %43 = select i1 %34, float 0.000000e+00, float %42
  %44 = select i1 %33, float 0x7FF0000000000000, float %43
  %45 = fadd contract float %27, %44
  %46 = add i32 %26, %10
  %47 = icmp ult i32 %46, %2
  br i1 %47, label %48, label %67

48:                                               ; preds = %25
  %49 = zext i32 %46 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !16, !amdgpu.noclobber !6
  %52 = fmul float %51, 0x3FF7154760000000
  %53 = tail call float @llvm.rint.f32(float %52)
  %54 = fcmp ogt float %51, 0x40562E4300000000
  %55 = fcmp olt float %51, 0xC059D1DA00000000
  %56 = fneg float %52
  %57 = tail call float @llvm.fma.f32(float %51, float 0x3FF7154760000000, float %56)
  %58 = tail call float @llvm.fma.f32(float %51, float 0x3E54AE0BE0000000, float %57)
  %59 = fsub float %52, %53
  %60 = fadd float %58, %59
  %61 = tail call float @llvm.exp2.f32(float %60)
  %62 = fptosi float %53 to i32
  %63 = tail call float @llvm.amdgcn.ldexp.f32(float %61, i32 %62)
  %64 = select i1 %55, float 0.000000e+00, float %63
  %65 = select i1 %54, float 0x7FF0000000000000, float %64
  %66 = fadd contract float %45, %65
  br label %67

67:                                               ; preds = %48, %25
  %68 = phi float [ %66, %48 ], [ %45, %25 ]
  %69 = add i32 %26, %23
  %70 = icmp ult i32 %69, %2
  br i1 %70, label %25, label %71, !llvm.loop !20

71:                                               ; preds = %67, %3
  %72 = phi float [ 0.000000e+00, %3 ], [ %68, %67 ]
  %73 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %4
  store float %72, float addrspace(3)* %73, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %74 = icmp ugt i16 %9, 511
  br i1 %74, label %75, label %84

75:                                               ; preds = %71
  %76 = icmp ult i32 %4, 256
  br i1 %76, label %77, label %82

77:                                               ; preds = %75
  %78 = add nuw nsw i32 %4, 256
  %79 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %78
  %80 = load float, float addrspace(3)* %79, align 4, !tbaa !16
  %81 = fadd contract float %72, %80
  store float %81, float addrspace(3)* %73, align 4, !tbaa !16
  br label %82

82:                                               ; preds = %77, %75
  %83 = phi float [ %81, %77 ], [ %72, %75 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %84

84:                                               ; preds = %82, %71
  %85 = phi float [ %83, %82 ], [ %72, %71 ]
  %86 = icmp ugt i16 %9, 255
  br i1 %86, label %87, label %96

87:                                               ; preds = %84
  %88 = icmp ult i32 %4, 128
  br i1 %88, label %89, label %94

89:                                               ; preds = %87
  %90 = add nuw nsw i32 %4, 128
  %91 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %90
  %92 = load float, float addrspace(3)* %91, align 4, !tbaa !16
  %93 = fadd contract float %85, %92
  store float %93, float addrspace(3)* %73, align 4, !tbaa !16
  br label %94

94:                                               ; preds = %89, %87
  %95 = phi float [ %93, %89 ], [ %85, %87 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %96

96:                                               ; preds = %94, %84
  %97 = phi float [ %95, %94 ], [ %85, %84 ]
  %98 = icmp ugt i16 %9, 127
  br i1 %98, label %99, label %108

99:                                               ; preds = %96
  %100 = icmp ult i32 %4, 64
  br i1 %100, label %101, label %106

101:                                              ; preds = %99
  %102 = add nuw nsw i32 %4, 64
  %103 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %102
  %104 = load float, float addrspace(3)* %103, align 4, !tbaa !16
  %105 = fadd contract float %97, %104
  store float %105, float addrspace(3)* %73, align 4, !tbaa !16
  br label %106

106:                                              ; preds = %101, %99
  %107 = phi float [ %105, %101 ], [ %97, %99 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %108

108:                                              ; preds = %106, %96
  %109 = phi float [ %107, %106 ], [ %97, %96 ]
  %110 = icmp ult i32 %4, 32
  br i1 %110, label %111, label %170

111:                                              ; preds = %108
  %112 = icmp ugt i16 %9, 63
  br i1 %112, label %113, label %120

113:                                              ; preds = %111
  %114 = add nuw nsw i32 %4, 32
  %115 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %114
  %116 = addrspacecast float addrspace(3)* %115 to float*
  %117 = load volatile float, float* %116, align 4, !tbaa !16
  %118 = fadd contract float %109, %117
  %119 = addrspacecast float addrspace(3)* %73 to float*
  store volatile float %118, float* %119, align 4, !tbaa !16
  br label %120

120:                                              ; preds = %113, %111
  %121 = phi float [ %118, %113 ], [ %109, %111 ]
  %122 = icmp ugt i16 %9, 31
  br i1 %122, label %123, label %130

123:                                              ; preds = %120
  %124 = add nuw nsw i32 %4, 16
  %125 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %124
  %126 = addrspacecast float addrspace(3)* %125 to float*
  %127 = load volatile float, float* %126, align 4, !tbaa !16
  %128 = fadd contract float %121, %127
  %129 = addrspacecast float addrspace(3)* %73 to float*
  store volatile float %128, float* %129, align 4, !tbaa !16
  br label %130

130:                                              ; preds = %123, %120
  %131 = phi float [ %128, %123 ], [ %121, %120 ]
  %132 = icmp ugt i16 %9, 15
  br i1 %132, label %133, label %140

133:                                              ; preds = %130
  %134 = add nuw nsw i32 %4, 8
  %135 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %134
  %136 = addrspacecast float addrspace(3)* %135 to float*
  %137 = load volatile float, float* %136, align 4, !tbaa !16
  %138 = fadd contract float %131, %137
  %139 = addrspacecast float addrspace(3)* %73 to float*
  store volatile float %138, float* %139, align 4, !tbaa !16
  br label %140

140:                                              ; preds = %133, %130
  %141 = phi float [ %138, %133 ], [ %131, %130 ]
  %142 = icmp ugt i16 %9, 7
  br i1 %142, label %143, label %150

143:                                              ; preds = %140
  %144 = add nuw nsw i32 %4, 4
  %145 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %144
  %146 = addrspacecast float addrspace(3)* %145 to float*
  %147 = load volatile float, float* %146, align 4, !tbaa !16
  %148 = fadd contract float %141, %147
  %149 = addrspacecast float addrspace(3)* %73 to float*
  store volatile float %148, float* %149, align 4, !tbaa !16
  br label %150

150:                                              ; preds = %143, %140
  %151 = phi float [ %148, %143 ], [ %141, %140 ]
  %152 = icmp ugt i16 %9, 3
  br i1 %152, label %153, label %160

153:                                              ; preds = %150
  %154 = add nuw nsw i32 %4, 2
  %155 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %154
  %156 = addrspacecast float addrspace(3)* %155 to float*
  %157 = load volatile float, float* %156, align 4, !tbaa !16
  %158 = fadd contract float %151, %157
  %159 = addrspacecast float addrspace(3)* %73 to float*
  store volatile float %158, float* %159, align 4, !tbaa !16
  br label %160

160:                                              ; preds = %153, %150
  %161 = phi float [ %158, %153 ], [ %151, %150 ]
  %162 = icmp ugt i16 %9, 1
  br i1 %162, label %163, label %170

163:                                              ; preds = %160
  %164 = add nuw nsw i32 %4, 1
  %165 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %164
  %166 = addrspacecast float addrspace(3)* %165 to float*
  %167 = load volatile float, float* %166, align 4, !tbaa !16
  %168 = fadd contract float %161, %167
  %169 = addrspacecast float addrspace(3)* %73 to float*
  store volatile float %168, float* %169, align 4, !tbaa !16
  br label %170

170:                                              ; preds = %160, %163, %108
  %171 = icmp eq i32 %4, 0
  br i1 %171, label %172, label %176

172:                                              ; preds = %170
  %173 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !16
  %174 = zext i32 %5 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %1, i64 %174
  store float %173, float addrspace(1)* %175, align 4, !tbaa !16
  br label %176

176:                                              ; preds = %172, %170
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
