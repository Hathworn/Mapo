; ModuleID = '../data/hip_kernels/1129/22/main.cu'
source_filename = "../data/hip_kernels/1129/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22matrixPolyderNewLayoutPKfPfiiim(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i64 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %9, %13
  %15 = add i32 %14, %7
  %16 = zext i32 %15 to i64
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = add i32 %23, %17
  %25 = zext i32 %24 to i64
  %26 = sext i32 %2 to i64
  %27 = icmp ult i64 %16, %26
  %28 = sext i32 %3 to i64
  %29 = icmp ult i64 %25, %28
  %30 = select i1 %27, i1 %29, i1 false
  br i1 %30, label %31, label %158

31:                                               ; preds = %6
  %32 = add i32 %4, -1
  %33 = icmp sgt i32 %4, 1
  br i1 %33, label %34, label %158

34:                                               ; preds = %31
  %35 = zext i32 %4 to i64
  %36 = zext i32 %32 to i64
  %37 = mul nsw i64 %25, %26
  %38 = add nsw i64 %37, %16
  %39 = mul i64 %38, %36
  %40 = mul i64 %38, %35
  %41 = add i32 %4, -2
  %42 = and i32 %32, 7
  %43 = icmp ult i32 %41, 7
  br i1 %43, label %139, label %44

44:                                               ; preds = %34
  %45 = and i32 %32, -8
  br label %46

46:                                               ; preds = %46, %44
  %47 = phi i32 [ 0, %44 ], [ %136, %46 ]
  %48 = phi i32 [ 0, %44 ], [ %137, %46 ]
  %49 = zext i32 %47 to i64
  %50 = add i64 %39, %49
  %51 = add i64 %40, %49
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7
  %54 = xor i32 %47, -1
  %55 = add i32 %54, %4
  %56 = sitofp i32 %55 to float
  %57 = fmul contract float %53, %56
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  store float %57, float addrspace(1)* %58, align 4, !tbaa !7
  %59 = or i32 %47, 1
  %60 = zext i32 %59 to i64
  %61 = add i64 %39, %60
  %62 = add i64 %40, %60
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = sub i32 %4, %47
  %66 = add i32 %65, -2
  %67 = sitofp i32 %66 to float
  %68 = fmul contract float %64, %67
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  store float %68, float addrspace(1)* %69, align 4, !tbaa !7
  %70 = or i32 %47, 2
  %71 = zext i32 %70 to i64
  %72 = add i64 %39, %71
  %73 = add i64 %40, %71
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7
  %76 = sub i32 %4, %47
  %77 = add i32 %76, -3
  %78 = sitofp i32 %77 to float
  %79 = fmul contract float %75, %78
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  store float %79, float addrspace(1)* %80, align 4, !tbaa !7
  %81 = or i32 %47, 3
  %82 = zext i32 %81 to i64
  %83 = add i64 %39, %82
  %84 = add i64 %40, %82
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = sub i32 %4, %47
  %88 = add i32 %87, -4
  %89 = sitofp i32 %88 to float
  %90 = fmul contract float %86, %89
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  store float %90, float addrspace(1)* %91, align 4, !tbaa !7
  %92 = or i32 %47, 4
  %93 = zext i32 %92 to i64
  %94 = add i64 %39, %93
  %95 = add i64 %40, %93
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7
  %98 = sub i32 %4, %47
  %99 = add i32 %98, -5
  %100 = sitofp i32 %99 to float
  %101 = fmul contract float %97, %100
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  store float %101, float addrspace(1)* %102, align 4, !tbaa !7
  %103 = or i32 %47, 5
  %104 = zext i32 %103 to i64
  %105 = add i64 %39, %104
  %106 = add i64 %40, %104
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7
  %109 = sub i32 %4, %47
  %110 = add i32 %109, -6
  %111 = sitofp i32 %110 to float
  %112 = fmul contract float %108, %111
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  store float %112, float addrspace(1)* %113, align 4, !tbaa !7
  %114 = or i32 %47, 6
  %115 = zext i32 %114 to i64
  %116 = add i64 %39, %115
  %117 = add i64 %40, %115
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7
  %120 = sub i32 %4, %47
  %121 = add i32 %120, -7
  %122 = sitofp i32 %121 to float
  %123 = fmul contract float %119, %122
  %124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %116
  store float %123, float addrspace(1)* %124, align 4, !tbaa !7
  %125 = or i32 %47, 7
  %126 = zext i32 %125 to i64
  %127 = add i64 %39, %126
  %128 = add i64 %40, %126
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7
  %131 = sub i32 %4, %47
  %132 = add i32 %131, -8
  %133 = sitofp i32 %132 to float
  %134 = fmul contract float %130, %133
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %127
  store float %134, float addrspace(1)* %135, align 4, !tbaa !7
  %136 = add nuw nsw i32 %47, 8
  %137 = add i32 %48, 8
  %138 = icmp eq i32 %137, %45
  br i1 %138, label %139, label %46, !llvm.loop !11

139:                                              ; preds = %46, %34
  %140 = phi i32 [ 0, %34 ], [ %136, %46 ]
  %141 = icmp eq i32 %42, 0
  br i1 %141, label %158, label %142

142:                                              ; preds = %139, %142
  %143 = phi i32 [ %155, %142 ], [ %140, %139 ]
  %144 = phi i32 [ %156, %142 ], [ 0, %139 ]
  %145 = zext i32 %143 to i64
  %146 = add i64 %39, %145
  %147 = add i64 %40, %145
  %148 = getelementptr inbounds float, float addrspace(1)* %0, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7
  %150 = xor i32 %143, -1
  %151 = add i32 %150, %4
  %152 = sitofp i32 %151 to float
  %153 = fmul contract float %149, %152
  %154 = getelementptr inbounds float, float addrspace(1)* %1, i64 %146
  store float %153, float addrspace(1)* %154, align 4, !tbaa !7
  %155 = add nuw nsw i32 %143, 1
  %156 = add i32 %144, 1
  %157 = icmp eq i32 %156, %42
  br i1 %157, label %158, label %142, !llvm.loop !13

158:                                              ; preds = %139, %142, %31, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
