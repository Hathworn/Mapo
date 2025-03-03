; ModuleID = '../data/hip_kernels/2300/2/main.cu'
source_filename = "../data/hip_kernels/2300/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14kernel_loopingPfj(float addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !7
  %13 = mul i32 %4, %9
  %14 = add i32 %13, %3
  %15 = zext i32 %14 to i64
  %16 = zext i32 %1 to i64
  %17 = icmp ult i32 %14, %1
  br i1 %17, label %18, label %170

18:                                               ; preds = %2
  %19 = udiv i32 %12, %9
  %20 = mul i32 %19, %9
  %21 = icmp ugt i32 %12, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %9
  %25 = zext i32 %24 to i64
  br label %171

26:                                               ; preds = %171
  br i1 %17, label %27, label %170

27:                                               ; preds = %26
  %28 = udiv i32 %12, %9
  %29 = mul i32 %28, %9
  %30 = icmp ugt i32 %12, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = mul i32 %32, %9
  %34 = zext i32 %33 to i64
  br label %35

35:                                               ; preds = %35, %27
  %36 = phi i64 [ %15, %27 ], [ %40, %35 ]
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %39 = fadd contract float %38, 1.000000e+00
  store float %39, float addrspace(1)* %37, align 4, !tbaa !16
  %40 = add i64 %36, %34
  %41 = icmp ult i64 %40, %16
  br i1 %41, label %35, label %42, !llvm.loop !20

42:                                               ; preds = %35
  br i1 %17, label %43, label %170

43:                                               ; preds = %42
  %44 = udiv i32 %12, %9
  %45 = mul i32 %44, %9
  %46 = icmp ugt i32 %12, %45
  %47 = zext i1 %46 to i32
  %48 = add i32 %44, %47
  %49 = mul i32 %48, %9
  %50 = zext i32 %49 to i64
  br label %51

51:                                               ; preds = %51, %43
  %52 = phi i64 [ %15, %43 ], [ %56, %51 ]
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %55 = fadd contract float %54, 1.000000e+00
  store float %55, float addrspace(1)* %53, align 4, !tbaa !16
  %56 = add i64 %52, %50
  %57 = icmp ult i64 %56, %16
  br i1 %57, label %51, label %58, !llvm.loop !20

58:                                               ; preds = %51
  br i1 %17, label %59, label %170

59:                                               ; preds = %58
  %60 = udiv i32 %12, %9
  %61 = mul i32 %60, %9
  %62 = icmp ugt i32 %12, %61
  %63 = zext i1 %62 to i32
  %64 = add i32 %60, %63
  %65 = mul i32 %64, %9
  %66 = zext i32 %65 to i64
  br label %67

67:                                               ; preds = %67, %59
  %68 = phi i64 [ %15, %59 ], [ %72, %67 ]
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !16
  %71 = fadd contract float %70, 1.000000e+00
  store float %71, float addrspace(1)* %69, align 4, !tbaa !16
  %72 = add i64 %68, %66
  %73 = icmp ult i64 %72, %16
  br i1 %73, label %67, label %74, !llvm.loop !20

74:                                               ; preds = %67
  br i1 %17, label %75, label %170

75:                                               ; preds = %74
  %76 = udiv i32 %12, %9
  %77 = mul i32 %76, %9
  %78 = icmp ugt i32 %12, %77
  %79 = zext i1 %78 to i32
  %80 = add i32 %76, %79
  %81 = mul i32 %80, %9
  %82 = zext i32 %81 to i64
  br label %83

83:                                               ; preds = %83, %75
  %84 = phi i64 [ %15, %75 ], [ %88, %83 ]
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !16
  %87 = fadd contract float %86, 1.000000e+00
  store float %87, float addrspace(1)* %85, align 4, !tbaa !16
  %88 = add i64 %84, %82
  %89 = icmp ult i64 %88, %16
  br i1 %89, label %83, label %90, !llvm.loop !20

90:                                               ; preds = %83
  br i1 %17, label %91, label %170

91:                                               ; preds = %90
  %92 = udiv i32 %12, %9
  %93 = mul i32 %92, %9
  %94 = icmp ugt i32 %12, %93
  %95 = zext i1 %94 to i32
  %96 = add i32 %92, %95
  %97 = mul i32 %96, %9
  %98 = zext i32 %97 to i64
  br label %99

99:                                               ; preds = %99, %91
  %100 = phi i64 [ %15, %91 ], [ %104, %99 ]
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !16
  %103 = fadd contract float %102, 1.000000e+00
  store float %103, float addrspace(1)* %101, align 4, !tbaa !16
  %104 = add i64 %100, %98
  %105 = icmp ult i64 %104, %16
  br i1 %105, label %99, label %106, !llvm.loop !20

106:                                              ; preds = %99
  br i1 %17, label %107, label %170

107:                                              ; preds = %106
  %108 = udiv i32 %12, %9
  %109 = mul i32 %108, %9
  %110 = icmp ugt i32 %12, %109
  %111 = zext i1 %110 to i32
  %112 = add i32 %108, %111
  %113 = mul i32 %112, %9
  %114 = zext i32 %113 to i64
  br label %115

115:                                              ; preds = %115, %107
  %116 = phi i64 [ %15, %107 ], [ %120, %115 ]
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !16
  %119 = fadd contract float %118, 1.000000e+00
  store float %119, float addrspace(1)* %117, align 4, !tbaa !16
  %120 = add i64 %116, %114
  %121 = icmp ult i64 %120, %16
  br i1 %121, label %115, label %122, !llvm.loop !20

122:                                              ; preds = %115
  br i1 %17, label %123, label %170

123:                                              ; preds = %122
  %124 = udiv i32 %12, %9
  %125 = mul i32 %124, %9
  %126 = icmp ugt i32 %12, %125
  %127 = zext i1 %126 to i32
  %128 = add i32 %124, %127
  %129 = mul i32 %128, %9
  %130 = zext i32 %129 to i64
  br label %131

131:                                              ; preds = %131, %123
  %132 = phi i64 [ %15, %123 ], [ %136, %131 ]
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !16
  %135 = fadd contract float %134, 1.000000e+00
  store float %135, float addrspace(1)* %133, align 4, !tbaa !16
  %136 = add i64 %132, %130
  %137 = icmp ult i64 %136, %16
  br i1 %137, label %131, label %138, !llvm.loop !20

138:                                              ; preds = %131
  br i1 %17, label %139, label %170

139:                                              ; preds = %138
  %140 = udiv i32 %12, %9
  %141 = mul i32 %140, %9
  %142 = icmp ugt i32 %12, %141
  %143 = zext i1 %142 to i32
  %144 = add i32 %140, %143
  %145 = mul i32 %144, %9
  %146 = zext i32 %145 to i64
  br label %147

147:                                              ; preds = %147, %139
  %148 = phi i64 [ %15, %139 ], [ %152, %147 ]
  %149 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !16
  %151 = fadd contract float %150, 1.000000e+00
  store float %151, float addrspace(1)* %149, align 4, !tbaa !16
  %152 = add i64 %148, %146
  %153 = icmp ult i64 %152, %16
  br i1 %153, label %147, label %154, !llvm.loop !20

154:                                              ; preds = %147
  br i1 %17, label %155, label %170

155:                                              ; preds = %154
  %156 = udiv i32 %12, %9
  %157 = mul i32 %156, %9
  %158 = icmp ugt i32 %12, %157
  %159 = zext i1 %158 to i32
  %160 = add i32 %156, %159
  %161 = mul i32 %160, %9
  %162 = zext i32 %161 to i64
  br label %163

163:                                              ; preds = %163, %155
  %164 = phi i64 [ %15, %155 ], [ %168, %163 ]
  %165 = getelementptr inbounds float, float addrspace(1)* %0, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !16
  %167 = fadd contract float %166, 1.000000e+00
  store float %167, float addrspace(1)* %165, align 4, !tbaa !16
  %168 = add i64 %164, %162
  %169 = icmp ult i64 %168, %16
  br i1 %169, label %163, label %170, !llvm.loop !20

170:                                              ; preds = %163, %2, %26, %42, %58, %74, %90, %106, %122, %138, %154
  ret void

171:                                              ; preds = %18, %171
  %172 = phi i64 [ %15, %18 ], [ %176, %171 ]
  %173 = getelementptr inbounds float, float addrspace(1)* %0, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !16
  %175 = fadd contract float %174, 1.000000e+00
  store float %175, float addrspace(1)* %173, align 4, !tbaa !16
  %176 = add i64 %172, %25
  %177 = icmp ult i64 %176, %16
  br i1 %177, label %171, label %26, !llvm.loop !20
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
