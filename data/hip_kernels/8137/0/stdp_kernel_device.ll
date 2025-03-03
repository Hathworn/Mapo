; ModuleID = '../data/hip_kernels/8137/0/main.cu'
source_filename = "../data/hip_kernels/8137/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11stdp_kernelPfiiiiS_iiiiS_S_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8, i32 %9, float addrspace(1)* nocapture readonly %10, float addrspace(1)* nocapture writeonly %11) local_unnamed_addr #0 {
  %13 = sdiv i32 %3, -2
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %18 = mul i32 %14, %8
  %19 = mul i32 %18, %7
  %20 = mul nsw i32 %9, %8
  %21 = mul nsw i32 %20, %15
  %22 = add i32 %19, %16
  %23 = mul i32 %22, %9
  %24 = add i32 %21, %17
  %25 = add i32 %24, %23
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %5, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !5, !amdgpu.noclobber !9
  %29 = fcmp contract une float %28, 1.000000e+00
  br i1 %29, label %161, label %30

30:                                               ; preds = %12
  %31 = mul i32 %15, %2
  %32 = mul i32 %4, %3
  %33 = mul i32 %32, %14
  %34 = mul i32 %33, %1
  %35 = mul i32 %34, %2
  %36 = icmp sgt i32 %2, 0
  br i1 %36, label %37, label %161

37:                                               ; preds = %30
  %38 = mul i32 %18, %2
  %39 = icmp sgt i32 %3, 0
  %40 = add i32 %13, %16
  %41 = icmp slt i32 %4, 1
  %42 = add i32 %13, %17
  %43 = and i32 %4, 1
  %44 = icmp eq i32 %4, 1
  %45 = and i32 %4, -2
  %46 = icmp eq i32 %43, 0
  br label %47

47:                                               ; preds = %37, %53
  %48 = phi i32 [ 0, %37 ], [ %54, %53 ]
  %49 = mul nsw i32 %48, %20
  br i1 %39, label %50, label %53

50:                                               ; preds = %47
  %51 = add i32 %48, %31
  %52 = mul i32 %51, %3
  br label %56

53:                                               ; preds = %158, %47
  %54 = add nuw nsw i32 %48, 1
  %55 = icmp eq i32 %54, %2
  br i1 %55, label %161, label %47, !llvm.loop !10

56:                                               ; preds = %50, %158
  %57 = phi i32 [ 0, %50 ], [ %159, %158 ]
  %58 = add i32 %40, %57
  %59 = icmp slt i32 %58, 0
  %60 = icmp sge i32 %58, %8
  %61 = select i1 %59, i1 true, i1 %60
  %62 = select i1 %61, i1 true, i1 %41
  br i1 %62, label %158, label %63

63:                                               ; preds = %56
  %64 = add i32 %52, %57
  %65 = mul i32 %64, %4
  %66 = add i32 %58, %38
  %67 = mul i32 %66, %9
  br i1 %44, label %129, label %68

68:                                               ; preds = %63, %125
  %69 = phi i32 [ %126, %125 ], [ 0, %63 ]
  %70 = phi i32 [ %127, %125 ], [ 0, %63 ]
  %71 = add i32 %65, %69
  %72 = add i32 %42, %69
  %73 = icmp sgt i32 %72, -1
  %74 = icmp slt i32 %72, %9
  %75 = select i1 %73, i1 %74, i1 false
  br i1 %75, label %76, label %97

76:                                               ; preds = %68
  %77 = add nsw i32 %71, %35
  %78 = add i32 %72, %49
  %79 = add i32 %78, %67
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %10, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5
  %83 = sext i32 %71 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !5
  %86 = fsub contract float 1.000000e+00, %85
  %87 = fmul contract float %85, %86
  %88 = fcmp contract une float %82, 0.000000e+00
  %89 = zext i1 %88 to i32
  %90 = fcmp contract oeq float %82, 0.000000e+00
  %91 = sext i1 %90 to i32
  %92 = add nsw i32 %91, %89
  %93 = sitofp i32 %92 to float
  %94 = fmul contract float %87, %93
  %95 = sext i32 %77 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %11, i64 %95
  store float %94, float addrspace(1)* %96, align 4, !tbaa !5
  br label %97

97:                                               ; preds = %68, %76
  %98 = or i32 %69, 1
  %99 = add i32 %65, %98
  %100 = add i32 %42, %98
  %101 = icmp sgt i32 %100, -1
  %102 = icmp slt i32 %100, %9
  %103 = select i1 %101, i1 %102, i1 false
  br i1 %103, label %104, label %125

104:                                              ; preds = %97
  %105 = add nsw i32 %99, %35
  %106 = add i32 %100, %49
  %107 = add i32 %106, %67
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %10, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !5
  %111 = sext i32 %99 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !5
  %114 = fsub contract float 1.000000e+00, %113
  %115 = fmul contract float %113, %114
  %116 = fcmp contract une float %110, 0.000000e+00
  %117 = zext i1 %116 to i32
  %118 = fcmp contract oeq float %110, 0.000000e+00
  %119 = sext i1 %118 to i32
  %120 = add nsw i32 %119, %117
  %121 = sitofp i32 %120 to float
  %122 = fmul contract float %115, %121
  %123 = sext i32 %105 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %11, i64 %123
  store float %122, float addrspace(1)* %124, align 4, !tbaa !5
  br label %125

125:                                              ; preds = %104, %97
  %126 = add nuw nsw i32 %69, 2
  %127 = add i32 %70, 2
  %128 = icmp eq i32 %127, %45
  br i1 %128, label %129, label %68, !llvm.loop !12

129:                                              ; preds = %125, %63
  %130 = phi i32 [ 0, %63 ], [ %126, %125 ]
  br i1 %46, label %158, label %131

131:                                              ; preds = %129
  %132 = add i32 %65, %130
  %133 = add i32 %42, %130
  %134 = icmp sgt i32 %133, -1
  %135 = icmp slt i32 %133, %9
  %136 = select i1 %134, i1 %135, i1 false
  br i1 %136, label %137, label %158

137:                                              ; preds = %131
  %138 = add nsw i32 %132, %35
  %139 = add i32 %133, %49
  %140 = add i32 %139, %67
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %10, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !5
  %144 = sext i32 %132 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %0, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !5
  %147 = fsub contract float 1.000000e+00, %146
  %148 = fmul contract float %146, %147
  %149 = fcmp contract une float %143, 0.000000e+00
  %150 = zext i1 %149 to i32
  %151 = fcmp contract oeq float %143, 0.000000e+00
  %152 = sext i1 %151 to i32
  %153 = add nsw i32 %152, %150
  %154 = sitofp i32 %153 to float
  %155 = fmul contract float %148, %154
  %156 = sext i32 %138 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %11, i64 %156
  store float %155, float addrspace(1)* %157, align 4, !tbaa !5
  br label %158

158:                                              ; preds = %129, %137, %131, %56
  %159 = add nuw nsw i32 %57, 1
  %160 = icmp eq i32 %159, %3
  br i1 %160, label %53, label %56, !llvm.loop !13

161:                                              ; preds = %53, %30, %12
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
