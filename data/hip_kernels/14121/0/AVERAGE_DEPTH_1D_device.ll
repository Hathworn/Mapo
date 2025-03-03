; ModuleID = '../data/hip_kernels/14121/0/main.cu'
source_filename = "../data/hip_kernels/14121/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @AVERAGE_DEPTH_1D(i32 %0, i32 %1, float addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %13, %0
  %23 = icmp slt i32 %21, %1
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %185

25:                                               ; preds = %4
  %26 = sub nsw i32 %13, %3
  %27 = add nsw i32 %13, %3
  %28 = icmp sgt i32 %26, %27
  br i1 %28, label %37, label %29

29:                                               ; preds = %25
  %30 = sub nsw i32 %21, %3
  %31 = add nsw i32 %21, %3
  %32 = icmp sgt i32 %30, %31
  %33 = add i32 %20, %3
  %34 = add i32 %33, %19
  %35 = add i32 %12, %3
  %36 = add i32 %35, %11
  br label %41

37:                                               ; preds = %173, %25
  %38 = phi float [ 0.000000e+00, %25 ], [ %174, %173 ]
  %39 = phi i32 [ 0, %25 ], [ %175, %173 ]
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %185, label %178

41:                                               ; preds = %29, %173
  %42 = phi i32 [ %26, %29 ], [ %176, %173 ]
  %43 = phi i32 [ 0, %29 ], [ %175, %173 ]
  %44 = phi float [ 0.000000e+00, %29 ], [ %174, %173 ]
  %45 = icmp slt i32 %42, 0
  br i1 %45, label %46, label %88

46:                                               ; preds = %41
  br i1 %32, label %173, label %47

47:                                               ; preds = %46
  %48 = add nsw i32 %42, %0
  %49 = mul nsw i32 %48, %0
  %50 = sub i32 %49, %1
  %51 = add i32 %49, %1
  br label %52

52:                                               ; preds = %47, %80
  %53 = phi i32 [ %30, %47 ], [ %86, %80 ]
  %54 = phi i32 [ %43, %47 ], [ %84, %80 ]
  %55 = phi float [ %44, %47 ], [ %85, %80 ]
  %56 = icmp slt i32 %53, 0
  br i1 %56, label %57, label %64

57:                                               ; preds = %52
  %58 = add i32 %51, %53
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = fcmp contract une float %61, -1.000000e+00
  %63 = select i1 %62, float %61, float -0.000000e+00
  br label %80

64:                                               ; preds = %52
  %65 = icmp slt i32 %53, %1
  br i1 %65, label %73, label %66

66:                                               ; preds = %64
  %67 = add i32 %50, %53
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %2, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = fcmp contract une float %70, -1.000000e+00
  %72 = select i1 %71, float %70, float -0.000000e+00
  br label %80

73:                                               ; preds = %64
  %74 = add nsw i32 %53, %49
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = fcmp contract une float %77, -1.000000e+00
  %79 = select i1 %78, float %77, float -0.000000e+00
  br label %80

80:                                               ; preds = %73, %57, %66
  %81 = phi float [ %63, %57 ], [ %72, %66 ], [ %79, %73 ]
  %82 = phi i1 [ %62, %57 ], [ %71, %66 ], [ %78, %73 ]
  %83 = zext i1 %82 to i32
  %84 = add nsw i32 %54, %83
  %85 = fadd contract float %55, %81
  %86 = add i32 %53, 1
  %87 = icmp eq i32 %53, %34
  br i1 %87, label %173, label %52, !llvm.loop !11

88:                                               ; preds = %41
  %89 = icmp slt i32 %42, %0
  br i1 %89, label %132, label %90

90:                                               ; preds = %88
  br i1 %32, label %173, label %91

91:                                               ; preds = %90
  %92 = sub nsw i32 %42, %0
  %93 = mul nsw i32 %92, %0
  %94 = sub i32 %93, %1
  %95 = add i32 %93, %1
  br label %96

96:                                               ; preds = %91, %124
  %97 = phi i32 [ %30, %91 ], [ %130, %124 ]
  %98 = phi i32 [ %43, %91 ], [ %128, %124 ]
  %99 = phi float [ %44, %91 ], [ %129, %124 ]
  %100 = icmp slt i32 %97, 0
  br i1 %100, label %101, label %108

101:                                              ; preds = %96
  %102 = add i32 %95, %97
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %2, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  %106 = fcmp contract une float %105, -1.000000e+00
  %107 = select i1 %106, float %105, float -0.000000e+00
  br label %124

108:                                              ; preds = %96
  %109 = icmp slt i32 %97, %1
  br i1 %109, label %117, label %110

110:                                              ; preds = %108
  %111 = add i32 %94, %97
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %2, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !5
  %115 = fcmp contract une float %114, -1.000000e+00
  %116 = select i1 %115, float %114, float -0.000000e+00
  br label %124

117:                                              ; preds = %108
  %118 = add nsw i32 %97, %93
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %2, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  %122 = fcmp contract une float %121, -1.000000e+00
  %123 = select i1 %122, float %121, float -0.000000e+00
  br label %124

124:                                              ; preds = %117, %101, %110
  %125 = phi float [ %107, %101 ], [ %116, %110 ], [ %123, %117 ]
  %126 = phi i1 [ %106, %101 ], [ %115, %110 ], [ %122, %117 ]
  %127 = zext i1 %126 to i32
  %128 = add nsw i32 %98, %127
  %129 = fadd contract float %99, %125
  %130 = add i32 %97, 1
  %131 = icmp eq i32 %97, %34
  br i1 %131, label %173, label %96, !llvm.loop !13

132:                                              ; preds = %88
  br i1 %32, label %173, label %133

133:                                              ; preds = %132
  %134 = mul nsw i32 %42, %0
  %135 = sub i32 %134, %1
  %136 = add i32 %134, %1
  br label %137

137:                                              ; preds = %133, %165
  %138 = phi i32 [ %30, %133 ], [ %171, %165 ]
  %139 = phi i32 [ %43, %133 ], [ %169, %165 ]
  %140 = phi float [ %44, %133 ], [ %170, %165 ]
  %141 = icmp slt i32 %138, 0
  br i1 %141, label %142, label %149

142:                                              ; preds = %137
  %143 = add i32 %136, %138
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %2, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7, !amdgpu.noclobber !5
  %147 = fcmp contract une float %146, -1.000000e+00
  %148 = select i1 %147, float %146, float -0.000000e+00
  br label %165

149:                                              ; preds = %137
  %150 = icmp slt i32 %138, %1
  br i1 %150, label %158, label %151

151:                                              ; preds = %149
  %152 = add i32 %135, %138
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %2, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !5
  %156 = fcmp contract une float %155, -1.000000e+00
  %157 = select i1 %156, float %155, float -0.000000e+00
  br label %165

158:                                              ; preds = %149
  %159 = add nsw i32 %138, %134
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %2, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !7, !amdgpu.noclobber !5
  %163 = fcmp contract une float %162, -1.000000e+00
  %164 = select i1 %163, float %162, float -0.000000e+00
  br label %165

165:                                              ; preds = %158, %142, %151
  %166 = phi float [ %148, %142 ], [ %157, %151 ], [ %164, %158 ]
  %167 = phi i1 [ %147, %142 ], [ %156, %151 ], [ %163, %158 ]
  %168 = zext i1 %167 to i32
  %169 = add nsw i32 %139, %168
  %170 = fadd contract float %140, %166
  %171 = add i32 %138, 1
  %172 = icmp eq i32 %138, %34
  br i1 %172, label %173, label %137, !llvm.loop !14

173:                                              ; preds = %124, %165, %80, %90, %132, %46
  %174 = phi float [ %44, %46 ], [ %44, %132 ], [ %44, %90 ], [ %85, %80 ], [ %170, %165 ], [ %129, %124 ]
  %175 = phi i32 [ %43, %46 ], [ %43, %132 ], [ %43, %90 ], [ %84, %80 ], [ %169, %165 ], [ %128, %124 ]
  %176 = add i32 %42, 1
  %177 = icmp eq i32 %42, %36
  br i1 %177, label %37, label %41, !llvm.loop !15

178:                                              ; preds = %37
  %179 = sitofp i32 %39 to float
  %180 = fdiv contract float %38, %179
  %181 = mul nsw i32 %13, %0
  %182 = add nsw i32 %181, %21
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %2, i64 %183
  store float %180, float addrspace(1)* %184, align 4, !tbaa !7
  br label %185

185:                                              ; preds = %37, %178, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
