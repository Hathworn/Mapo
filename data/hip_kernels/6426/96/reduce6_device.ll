; ModuleID = '../data/hip_kernels/6426/96/main.cu'
source_filename = "../data/hip_kernels/6426/96/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sharedData = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7reduce6PKfPfS1_j(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedData, i32 0, i32 %9
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %16 = shl i32 %13, 1
  %17 = mul i32 %16, %9
  %18 = add i32 %17, %15
  %19 = shl nuw nsw i32 %9, 1
  %20 = udiv i32 %12, %9
  %21 = mul i32 %20, %9
  %22 = icmp ugt i32 %12, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %19, %24
  %26 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedData, i32 0, i32 %15
  store float 0.000000e+00, float addrspace(3)* %26, align 4, !tbaa !16
  %27 = getelementptr inbounds float, float addrspace(3)* %14, i32 %15
  store float 0.000000e+00, float addrspace(3)* %27, align 4, !tbaa !16
  %28 = icmp ult i32 %18, %3
  br i1 %28, label %29, label %56

29:                                               ; preds = %4, %50
  %30 = phi float [ %51, %50 ], [ 0.000000e+00, %4 ]
  %31 = phi float [ %52, %50 ], [ 0.000000e+00, %4 ]
  %32 = phi i32 [ %53, %50 ], [ %18, %4 ]
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !16, !amdgpu.noclobber !5
  %36 = fadd contract float %35, %31
  %37 = fcmp contract ogt float %35, 0.000000e+00
  %38 = uitofp i1 %37 to float
  %39 = fadd contract float %30, %38
  %40 = add i32 %32, %9
  %41 = icmp ult i32 %40, %3
  br i1 %41, label %42, label %50

42:                                               ; preds = %29
  %43 = zext i32 %40 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !16, !amdgpu.noclobber !5
  %46 = fadd contract float %36, %45
  %47 = fcmp contract ogt float %45, 0.000000e+00
  %48 = uitofp i1 %47 to float
  %49 = fadd contract float %39, %48
  br label %50

50:                                               ; preds = %42, %29
  %51 = phi float [ %49, %42 ], [ %39, %29 ]
  %52 = phi float [ %46, %42 ], [ %36, %29 ]
  %53 = add i32 %32, %25
  %54 = icmp ult i32 %53, %3
  br i1 %54, label %29, label %55, !llvm.loop !20

55:                                               ; preds = %50
  store float %52, float addrspace(3)* %26, align 4, !tbaa !16
  store float %51, float addrspace(3)* %27, align 4, !tbaa !16
  br label %56

56:                                               ; preds = %55, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %57 = icmp ugt i16 %8, 511
  br i1 %57, label %58, label %71

58:                                               ; preds = %56
  %59 = icmp ult i32 %15, 256
  br i1 %59, label %60, label %70

60:                                               ; preds = %58
  %61 = add nuw nsw i32 %15, 256
  %62 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedData, i32 0, i32 %61
  %63 = load float, float addrspace(3)* %62, align 4, !tbaa !16
  %64 = load float, float addrspace(3)* %26, align 4, !tbaa !16
  %65 = fadd contract float %63, %64
  store float %65, float addrspace(3)* %26, align 4, !tbaa !16
  %66 = getelementptr inbounds float, float addrspace(3)* %14, i32 %61
  %67 = load float, float addrspace(3)* %66, align 4, !tbaa !16
  %68 = load float, float addrspace(3)* %27, align 4, !tbaa !16
  %69 = fadd contract float %67, %68
  store float %69, float addrspace(3)* %27, align 4, !tbaa !16
  br label %70

70:                                               ; preds = %60, %58
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %71

71:                                               ; preds = %70, %56
  %72 = icmp ugt i16 %8, 255
  br i1 %72, label %73, label %86

73:                                               ; preds = %71
  %74 = icmp ult i32 %15, 128
  br i1 %74, label %75, label %85

75:                                               ; preds = %73
  %76 = add nuw nsw i32 %15, 128
  %77 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedData, i32 0, i32 %76
  %78 = load float, float addrspace(3)* %77, align 4, !tbaa !16
  %79 = load float, float addrspace(3)* %26, align 4, !tbaa !16
  %80 = fadd contract float %78, %79
  store float %80, float addrspace(3)* %26, align 4, !tbaa !16
  %81 = getelementptr inbounds float, float addrspace(3)* %14, i32 %76
  %82 = load float, float addrspace(3)* %81, align 4, !tbaa !16
  %83 = load float, float addrspace(3)* %27, align 4, !tbaa !16
  %84 = fadd contract float %82, %83
  store float %84, float addrspace(3)* %27, align 4, !tbaa !16
  br label %85

85:                                               ; preds = %75, %73
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %86

86:                                               ; preds = %85, %71
  %87 = icmp ugt i16 %8, 127
  br i1 %87, label %88, label %101

88:                                               ; preds = %86
  %89 = icmp ult i32 %15, 64
  br i1 %89, label %90, label %100

90:                                               ; preds = %88
  %91 = add nuw nsw i32 %15, 64
  %92 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedData, i32 0, i32 %91
  %93 = load float, float addrspace(3)* %92, align 4, !tbaa !16
  %94 = load float, float addrspace(3)* %26, align 4, !tbaa !16
  %95 = fadd contract float %93, %94
  store float %95, float addrspace(3)* %26, align 4, !tbaa !16
  %96 = getelementptr inbounds float, float addrspace(3)* %14, i32 %91
  %97 = load float, float addrspace(3)* %96, align 4, !tbaa !16
  %98 = load float, float addrspace(3)* %27, align 4, !tbaa !16
  %99 = fadd contract float %97, %98
  store float %99, float addrspace(3)* %27, align 4, !tbaa !16
  br label %100

100:                                              ; preds = %90, %88
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %101

101:                                              ; preds = %100, %86
  %102 = icmp ult i32 %15, 32
  br i1 %102, label %103, label %175

103:                                              ; preds = %101
  %104 = icmp ugt i16 %8, 63
  br i1 %104, label %105, label %115

105:                                              ; preds = %103
  %106 = add nuw nsw i32 %15, 32
  %107 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedData, i32 0, i32 %106
  %108 = load float, float addrspace(3)* %107, align 4, !tbaa !16
  %109 = load float, float addrspace(3)* %26, align 4, !tbaa !16
  %110 = fadd contract float %108, %109
  store float %110, float addrspace(3)* %26, align 4, !tbaa !16
  %111 = getelementptr inbounds float, float addrspace(3)* %14, i32 %106
  %112 = load float, float addrspace(3)* %111, align 4, !tbaa !16
  %113 = load float, float addrspace(3)* %27, align 4, !tbaa !16
  %114 = fadd contract float %112, %113
  store float %114, float addrspace(3)* %27, align 4, !tbaa !16
  br label %115

115:                                              ; preds = %105, %103
  %116 = icmp ugt i16 %8, 31
  br i1 %116, label %117, label %127

117:                                              ; preds = %115
  %118 = add nuw nsw i32 %15, 16
  %119 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedData, i32 0, i32 %118
  %120 = load float, float addrspace(3)* %119, align 4, !tbaa !16
  %121 = load float, float addrspace(3)* %26, align 4, !tbaa !16
  %122 = fadd contract float %120, %121
  store float %122, float addrspace(3)* %26, align 4, !tbaa !16
  %123 = getelementptr inbounds float, float addrspace(3)* %14, i32 %118
  %124 = load float, float addrspace(3)* %123, align 4, !tbaa !16
  %125 = load float, float addrspace(3)* %27, align 4, !tbaa !16
  %126 = fadd contract float %124, %125
  store float %126, float addrspace(3)* %27, align 4, !tbaa !16
  br label %127

127:                                              ; preds = %117, %115
  %128 = icmp ugt i16 %8, 15
  br i1 %128, label %129, label %139

129:                                              ; preds = %127
  %130 = add nuw nsw i32 %15, 8
  %131 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedData, i32 0, i32 %130
  %132 = load float, float addrspace(3)* %131, align 4, !tbaa !16
  %133 = load float, float addrspace(3)* %26, align 4, !tbaa !16
  %134 = fadd contract float %132, %133
  store float %134, float addrspace(3)* %26, align 4, !tbaa !16
  %135 = getelementptr inbounds float, float addrspace(3)* %14, i32 %130
  %136 = load float, float addrspace(3)* %135, align 4, !tbaa !16
  %137 = load float, float addrspace(3)* %27, align 4, !tbaa !16
  %138 = fadd contract float %136, %137
  store float %138, float addrspace(3)* %27, align 4, !tbaa !16
  br label %139

139:                                              ; preds = %129, %127
  %140 = icmp ugt i16 %8, 7
  br i1 %140, label %141, label %151

141:                                              ; preds = %139
  %142 = add nuw nsw i32 %15, 4
  %143 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedData, i32 0, i32 %142
  %144 = load float, float addrspace(3)* %143, align 4, !tbaa !16
  %145 = load float, float addrspace(3)* %26, align 4, !tbaa !16
  %146 = fadd contract float %144, %145
  store float %146, float addrspace(3)* %26, align 4, !tbaa !16
  %147 = getelementptr inbounds float, float addrspace(3)* %14, i32 %142
  %148 = load float, float addrspace(3)* %147, align 4, !tbaa !16
  %149 = load float, float addrspace(3)* %27, align 4, !tbaa !16
  %150 = fadd contract float %148, %149
  store float %150, float addrspace(3)* %27, align 4, !tbaa !16
  br label %151

151:                                              ; preds = %141, %139
  %152 = icmp ugt i16 %8, 3
  br i1 %152, label %153, label %163

153:                                              ; preds = %151
  %154 = add nuw nsw i32 %15, 2
  %155 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedData, i32 0, i32 %154
  %156 = load float, float addrspace(3)* %155, align 4, !tbaa !16
  %157 = load float, float addrspace(3)* %26, align 4, !tbaa !16
  %158 = fadd contract float %156, %157
  store float %158, float addrspace(3)* %26, align 4, !tbaa !16
  %159 = getelementptr inbounds float, float addrspace(3)* %14, i32 %154
  %160 = load float, float addrspace(3)* %159, align 4, !tbaa !16
  %161 = load float, float addrspace(3)* %27, align 4, !tbaa !16
  %162 = fadd contract float %160, %161
  store float %162, float addrspace(3)* %27, align 4, !tbaa !16
  br label %163

163:                                              ; preds = %153, %151
  %164 = icmp ugt i16 %8, 1
  br i1 %164, label %165, label %175

165:                                              ; preds = %163
  %166 = add nuw nsw i32 %15, 1
  %167 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sharedData, i32 0, i32 %166
  %168 = load float, float addrspace(3)* %167, align 4, !tbaa !16
  %169 = load float, float addrspace(3)* %26, align 4, !tbaa !16
  %170 = fadd contract float %168, %169
  store float %170, float addrspace(3)* %26, align 4, !tbaa !16
  %171 = getelementptr inbounds float, float addrspace(3)* %14, i32 %166
  %172 = load float, float addrspace(3)* %171, align 4, !tbaa !16
  %173 = load float, float addrspace(3)* %27, align 4, !tbaa !16
  %174 = fadd contract float %172, %173
  store float %174, float addrspace(3)* %27, align 4, !tbaa !16
  br label %175

175:                                              ; preds = %163, %165, %101
  %176 = icmp eq i32 %15, 0
  br i1 %176, label %177, label %183

177:                                              ; preds = %175
  %178 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sharedData, i32 0, i32 0), align 4, !tbaa !16
  %179 = zext i32 %13 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %1, i64 %179
  store float %178, float addrspace(1)* %180, align 4, !tbaa !16
  %181 = load float, float addrspace(3)* %14, align 4, !tbaa !16
  %182 = getelementptr inbounds float, float addrspace(1)* %2, i64 %179
  store float %181, float addrspace(1)* %182, align 4, !tbaa !16
  br label %183

183:                                              ; preds = %177, %175
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
