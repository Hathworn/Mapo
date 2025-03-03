; ModuleID = '../data/hip_kernels/4310/13/main.cu'
source_filename = "../data/hip_kernels/4310/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_Kernel = protected addrspace(4) externally_initialized global [192 x float] zeroinitializer, align 16
@_ZZ15LowPassColMultiPfS_iiiE4data = internal unnamed_addr addrspace(3) global [1536 x float] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([192 x float] addrspace(4)* @d_Kernel to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15LowPassColMultiPfS_iii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = and i32 %8, 7
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = mul i32 %10, 40
  %12 = add nsw i32 %11, 40
  %13 = tail call i32 @llvm.smin.i32(i32 %12, i32 %4)
  %14 = add nsw i32 %13, 3
  %15 = shl nsw i32 %8, 2
  %16 = and i32 %15, -32
  %17 = add nsw i32 %16, %6
  %18 = add nsw i32 %4, -1
  %19 = mul nsw i32 %18, %3
  %20 = add nsw i32 %19, %17
  %21 = shl nsw i32 %3, 3
  %22 = shl nuw nsw i32 %9, 4
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds [192 x float], [192 x float] addrspace(4)* @d_Kernel, i64 0, i64 %23
  %25 = mul i32 %9, %3
  %26 = mul i32 %25, %4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  %30 = icmp slt i32 %17, %2
  br i1 %30, label %31, label %67

31:                                               ; preds = %5
  %32 = add i32 %11, %7
  %33 = add nsw i32 %32, -4
  %34 = icmp sgt i32 %33, %14
  br i1 %34, label %67, label %35

35:                                               ; preds = %31
  %36 = mul nsw i32 %33, %3
  %37 = add nsw i32 %36, %17
  %38 = shl nuw nsw i32 %7, 5
  %39 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ15LowPassColMultiPfS_iiiE4data, i32 0, i32 %38
  %40 = getelementptr inbounds float, float addrspace(3)* %39, i32 %6
  %41 = sext i32 %20 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %29, i64 %41
  %43 = sext i32 %17 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %29, i64 %43
  %45 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %46 = getelementptr i8, i8 addrspace(4)* %45, i64 6
  %47 = bitcast i8 addrspace(4)* %46 to i16 addrspace(4)*
  %48 = load i16, i16 addrspace(4)* %47, align 2, !range !5, !invariant.load !6
  %49 = zext i16 %48 to i32
  br label %50

50:                                               ; preds = %35, %60
  %51 = phi i32 [ %33, %35 ], [ %65, %60 ]
  %52 = phi i32 [ %37, %35 ], [ %64, %60 ]
  %53 = phi float addrspace(3)* [ %40, %35 ], [ %63, %60 ]
  %54 = icmp slt i32 %51, 0
  br i1 %54, label %60, label %55

55:                                               ; preds = %50
  %56 = icmp slt i32 %51, %4
  br i1 %56, label %57, label %60

57:                                               ; preds = %55
  %58 = sext i32 %52 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %29, i64 %58
  br label %60

60:                                               ; preds = %55, %50, %57
  %61 = phi float addrspace(1)* [ %59, %57 ], [ %44, %50 ], [ %42, %55 ]
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  store float %62, float addrspace(3)* %53, align 4, !tbaa !7
  %63 = getelementptr inbounds float, float addrspace(3)* %53, i32 256
  %64 = add nsw i32 %52, %21
  %65 = add i32 %51, %49
  %66 = icmp sgt i32 %65, %14
  br i1 %66, label %67, label %50, !llvm.loop !11

67:                                               ; preds = %60, %31, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %30, label %68, label %131

68:                                               ; preds = %67
  %69 = add nsw i32 %11, %7
  %70 = icmp slt i32 %69, %13
  br i1 %70, label %71, label %131

71:                                               ; preds = %68
  %72 = mul nsw i32 %69, %3
  %73 = add nsw i32 %72, %17
  %74 = shl nuw nsw i32 %7, 5
  %75 = getelementptr inbounds [1536 x float], [1536 x float] addrspace(3)* @_ZZ15LowPassColMultiPfS_iiiE4data, i32 0, i32 %74
  %76 = getelementptr inbounds float, float addrspace(3)* %75, i32 %6
  %77 = load float, float addrspace(4)* %24, align 16, !tbaa !7
  %78 = getelementptr inbounds float, float addrspace(4)* %24, i64 1
  %79 = load float, float addrspace(4)* %78, align 4, !tbaa !7
  %80 = getelementptr inbounds float, float addrspace(4)* %24, i64 2
  %81 = load float, float addrspace(4)* %80, align 8, !tbaa !7
  %82 = getelementptr inbounds float, float addrspace(4)* %24, i64 3
  %83 = load float, float addrspace(4)* %82, align 4, !tbaa !7
  %84 = getelementptr inbounds float, float addrspace(4)* %24, i64 4
  %85 = load float, float addrspace(4)* %84, align 16, !tbaa !7
  %86 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %87 = getelementptr i8, i8 addrspace(4)* %86, i64 6
  %88 = bitcast i8 addrspace(4)* %87 to i16 addrspace(4)*
  %89 = load i16, i16 addrspace(4)* %88, align 2, !range !5, !invariant.load !6
  %90 = zext i16 %89 to i32
  %91 = load float, float addrspace(3)* %76, align 4, !tbaa !7
  br label %92

92:                                               ; preds = %71, %92
  %93 = phi float [ %91, %71 ], [ %98, %92 ]
  %94 = phi i32 [ %69, %71 ], [ %129, %92 ]
  %95 = phi i32 [ %73, %71 ], [ %128, %92 ]
  %96 = phi float addrspace(3)* [ %76, %71 ], [ %97, %92 ]
  %97 = getelementptr inbounds float, float addrspace(3)* %96, i32 256
  %98 = load float, float addrspace(3)* %97, align 4, !tbaa !7
  %99 = fadd contract float %93, %98
  %100 = fmul contract float %99, %77
  %101 = getelementptr inbounds float, float addrspace(3)* %96, i32 32
  %102 = load float, float addrspace(3)* %101, align 4, !tbaa !7
  %103 = getelementptr inbounds float, float addrspace(3)* %96, i32 224
  %104 = load float, float addrspace(3)* %103, align 4, !tbaa !7
  %105 = fadd contract float %102, %104
  %106 = fmul contract float %105, %79
  %107 = fadd contract float %100, %106
  %108 = getelementptr inbounds float, float addrspace(3)* %96, i32 64
  %109 = load float, float addrspace(3)* %108, align 4, !tbaa !7
  %110 = getelementptr inbounds float, float addrspace(3)* %96, i32 192
  %111 = load float, float addrspace(3)* %110, align 4, !tbaa !7
  %112 = fadd contract float %109, %111
  %113 = fmul contract float %112, %81
  %114 = fadd contract float %107, %113
  %115 = getelementptr inbounds float, float addrspace(3)* %96, i32 96
  %116 = load float, float addrspace(3)* %115, align 4, !tbaa !7
  %117 = getelementptr inbounds float, float addrspace(3)* %96, i32 160
  %118 = load float, float addrspace(3)* %117, align 4, !tbaa !7
  %119 = fadd contract float %116, %118
  %120 = fmul contract float %119, %83
  %121 = fadd contract float %114, %120
  %122 = getelementptr inbounds float, float addrspace(3)* %96, i32 128
  %123 = load float, float addrspace(3)* %122, align 4, !tbaa !7
  %124 = fmul contract float %123, %85
  %125 = fadd contract float %121, %124
  %126 = sext i32 %95 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %28, i64 %126
  store float %125, float addrspace(1)* %127, align 4, !tbaa !7
  %128 = add nsw i32 %95, %21
  %129 = add i32 %94, %90
  %130 = icmp slt i32 %129, %13
  br i1 %130, label %92, label %131, !llvm.loop !13

131:                                              ; preds = %92, %68, %67
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
