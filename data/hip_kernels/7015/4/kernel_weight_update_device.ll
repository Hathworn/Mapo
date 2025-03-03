; ModuleID = '../data/hip_kernels/7015/4/main.cu'
source_filename = "../data/hip_kernels/7015/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z20kernel_weight_updateiPiS_S_PfS0_S0_S0_S0_S0_ff(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readnone %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readnone %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture %8, float addrspace(1)* nocapture %9, float %10, float %11) local_unnamed_addr #1 {
  %13 = alloca i32, align 4, addrspace(5)
  %14 = addrspacecast i32 addrspace(5)* %13 to i32*
  %15 = bitcast i32 addrspace(5)* %13 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %15) #3
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = mul i32 %22, %21
  %24 = add i32 %23, %16
  store volatile i32 %24, i32* %14, align 4, !tbaa !7
  %25 = sext i32 %0 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = add nsw i32 %0, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = load volatile i32, i32* %14, align 4, !tbaa !7
  %33 = icmp slt i32 %32, %27
  br i1 %33, label %34, label %163

34:                                               ; preds = %12
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %25
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !6
  %37 = load volatile i32, i32* %14, align 4, !tbaa !7
  %38 = add nsw i32 %37, %36
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %5, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !11, !amdgpu.noclobber !6
  %42 = add i32 %31, -1
  %43 = icmp sgt i32 %31, 1
  br i1 %43, label %44, label %163

44:                                               ; preds = %34
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %29
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !6
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %25
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !6
  %49 = and i32 %42, 1
  %50 = icmp eq i32 %31, 2
  br i1 %50, label %126, label %51

51:                                               ; preds = %44
  %52 = and i32 %42, -2
  br label %53

53:                                               ; preds = %53, %51
  %54 = phi i32 [ 0, %51 ], [ %123, %53 ]
  %55 = phi i32 [ 0, %51 ], [ %124, %53 ]
  %56 = add nsw i32 %46, %54
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %7, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !11
  %60 = fmul contract float %41, %59
  %61 = load volatile i32, i32* %14, align 4, !tbaa !7
  %62 = mul nsw i32 %61, %42
  %63 = add i32 %48, %54
  %64 = add i32 %63, %62
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %9, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !11
  %68 = fmul contract float %67, %11
  %69 = fmul contract float %60, %10
  %70 = fsub contract float %68, %69
  %71 = load volatile i32, i32* %14, align 4, !tbaa !7
  %72 = mul nsw i32 %71, %42
  %73 = add i32 %63, %72
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %9, i64 %74
  store float %70, float addrspace(1)* %75, align 4, !tbaa !11
  %76 = load volatile i32, i32* %14, align 4, !tbaa !7
  %77 = mul nsw i32 %76, %42
  %78 = add i32 %63, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %9, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !11
  %82 = load volatile i32, i32* %14, align 4, !tbaa !7
  %83 = mul nsw i32 %82, %42
  %84 = add i32 %63, %83
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %8, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !11
  %88 = fadd contract float %81, %87
  store float %88, float addrspace(1)* %86, align 4, !tbaa !11
  %89 = or i32 %54, 1
  %90 = add nsw i32 %46, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %7, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !11
  %94 = fmul contract float %41, %93
  %95 = load volatile i32, i32* %14, align 4, !tbaa !7
  %96 = mul nsw i32 %95, %42
  %97 = add i32 %48, %89
  %98 = add i32 %97, %96
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %9, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !11
  %102 = fmul contract float %101, %11
  %103 = fmul contract float %94, %10
  %104 = fsub contract float %102, %103
  %105 = load volatile i32, i32* %14, align 4, !tbaa !7
  %106 = mul nsw i32 %105, %42
  %107 = add i32 %97, %106
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %9, i64 %108
  store float %104, float addrspace(1)* %109, align 4, !tbaa !11
  %110 = load volatile i32, i32* %14, align 4, !tbaa !7
  %111 = mul nsw i32 %110, %42
  %112 = add i32 %97, %111
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %9, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !11
  %116 = load volatile i32, i32* %14, align 4, !tbaa !7
  %117 = mul nsw i32 %116, %42
  %118 = add i32 %97, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %8, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !11
  %122 = fadd contract float %115, %121
  store float %122, float addrspace(1)* %120, align 4, !tbaa !11
  %123 = add nuw nsw i32 %54, 2
  %124 = add i32 %55, 2
  %125 = icmp eq i32 %124, %52
  br i1 %125, label %126, label %53, !llvm.loop !13

126:                                              ; preds = %53, %44
  %127 = phi i32 [ 0, %44 ], [ %123, %53 ]
  %128 = icmp eq i32 %49, 0
  br i1 %128, label %163, label %129

129:                                              ; preds = %126
  %130 = add nsw i32 %46, %127
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %7, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !11
  %134 = fmul contract float %41, %133
  %135 = load volatile i32, i32* %14, align 4, !tbaa !7
  %136 = mul nsw i32 %135, %42
  %137 = add i32 %48, %127
  %138 = add i32 %137, %136
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %9, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !11
  %142 = fmul contract float %141, %11
  %143 = fmul contract float %134, %10
  %144 = fsub contract float %142, %143
  %145 = load volatile i32, i32* %14, align 4, !tbaa !7
  %146 = mul nsw i32 %145, %42
  %147 = add i32 %137, %146
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %9, i64 %148
  store float %144, float addrspace(1)* %149, align 4, !tbaa !11
  %150 = load volatile i32, i32* %14, align 4, !tbaa !7
  %151 = mul nsw i32 %150, %42
  %152 = add i32 %137, %151
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %9, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !11
  %156 = load volatile i32, i32* %14, align 4, !tbaa !7
  %157 = mul nsw i32 %156, %42
  %158 = add i32 %137, %157
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %8, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !11
  %162 = fadd contract float %155, %161
  store float %162, float addrspace(1)* %160, align 4, !tbaa !11
  br label %163

163:                                              ; preds = %129, %126, %34, %12
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %15) #3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

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
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
