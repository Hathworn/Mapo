; ModuleID = '../data/hip_kernels/121/132/main.cu'
source_filename = "../data/hip_kernels/121/132/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z30kGenerateTranslationsBigVarOffPfS_S_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = sub nsw i32 %4, %5
  %16 = sdiv i32 %15, 2
  %17 = mul nsw i32 %5, %5
  %18 = zext i32 %14 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %3, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = fptosi float %20 to i32
  %22 = mul i32 %17, %14
  %23 = add nsw i32 %16, %21
  %24 = icmp ult i32 %8, %17
  br i1 %24, label %25, label %37

25:                                               ; preds = %7
  %26 = mul i32 %14, %4
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 %18
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !6
  %29 = fptosi float %28 to i32
  %30 = icmp eq i32 %6, 0
  %31 = add i32 %16, %26
  %32 = add i32 %31, %29
  %33 = and i32 %6, 7
  %34 = icmp ult i32 %6, 8
  %35 = and i32 %6, -8
  %36 = icmp eq i32 %33, 0
  br label %38

37:                                               ; preds = %66, %7
  ret void

38:                                               ; preds = %25, %66
  %39 = phi i32 [ %8, %25 ], [ %67, %66 ]
  %40 = udiv i32 %39, %5
  br i1 %30, label %66, label %41

41:                                               ; preds = %38
  %42 = mul nsw i32 %40, %5
  %43 = add i32 %32, %40
  %44 = mul i32 %43, %4
  %45 = add i32 %23, %39
  %46 = sub i32 %45, %42
  %47 = add i32 %46, %44
  %48 = mul nsw i32 %47, %6
  %49 = add i32 %39, %22
  %50 = mul nsw i32 %49, %6
  br i1 %34, label %51, label %69

51:                                               ; preds = %69, %41
  %52 = phi i32 [ 0, %41 ], [ %135, %69 ]
  br i1 %36, label %66, label %53

53:                                               ; preds = %51, %53
  %54 = phi i32 [ %63, %53 ], [ %52, %51 ]
  %55 = phi i32 [ %64, %53 ], [ 0, %51 ]
  %56 = add i32 %54, %48
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = add i32 %54, %50
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  store float %59, float addrspace(1)* %62, align 4, !tbaa !7
  %63 = add nuw i32 %54, 1
  %64 = add i32 %55, 1
  %65 = icmp eq i32 %64, %33
  br i1 %65, label %66, label %53, !llvm.loop !11

66:                                               ; preds = %51, %53, %38
  %67 = add i32 %39, %13
  %68 = icmp ult i32 %67, %17
  br i1 %68, label %38, label %37, !llvm.loop !13

69:                                               ; preds = %41, %69
  %70 = phi i32 [ %135, %69 ], [ 0, %41 ]
  %71 = phi i32 [ %136, %69 ], [ 0, %41 ]
  %72 = add i32 %70, %48
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7
  %76 = add i32 %70, %50
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  store float %75, float addrspace(1)* %78, align 4, !tbaa !7
  %79 = or i32 %70, 1
  %80 = add i32 %79, %48
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7
  %84 = add i32 %79, %50
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %1, i64 %85
  store float %83, float addrspace(1)* %86, align 4, !tbaa !7
  %87 = or i32 %70, 2
  %88 = add i32 %87, %48
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = add i32 %87, %50
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  store float %91, float addrspace(1)* %94, align 4, !tbaa !7
  %95 = or i32 %70, 3
  %96 = add i32 %95, %48
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7
  %100 = add i32 %95, %50
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  store float %99, float addrspace(1)* %102, align 4, !tbaa !7
  %103 = or i32 %70, 4
  %104 = add i32 %103, %48
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7
  %108 = add i32 %103, %50
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %109
  store float %107, float addrspace(1)* %110, align 4, !tbaa !7
  %111 = or i32 %70, 5
  %112 = add i32 %111, %48
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7
  %116 = add i32 %111, %50
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 %117
  store float %115, float addrspace(1)* %118, align 4, !tbaa !7
  %119 = or i32 %70, 6
  %120 = add i32 %119, %48
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !7
  %124 = add i32 %119, %50
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %1, i64 %125
  store float %123, float addrspace(1)* %126, align 4, !tbaa !7
  %127 = or i32 %70, 7
  %128 = add i32 %127, %48
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = add i32 %127, %50
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %1, i64 %133
  store float %131, float addrspace(1)* %134, align 4, !tbaa !7
  %135 = add nuw i32 %70, 8
  %136 = add i32 %71, 8
  %137 = icmp eq i32 %136, %35
  br i1 %137, label %51, label %69, !llvm.loop !15
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
