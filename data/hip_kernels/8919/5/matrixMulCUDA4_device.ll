; ModuleID = '../data/hip_kernels/8919/5/main.cu'
source_filename = "../data/hip_kernels/8919/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14matrixMulCUDA4PfS_S_j(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = shl nuw nsw i32 %12, 5
  %14 = add i32 %11, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = shl nuw nsw i32 %21, 5
  %23 = add i32 %20, %22
  %24 = add nsw i32 %23, 31
  %25 = add nsw i32 %14, 31
  %26 = and i32 %3, 7
  %27 = icmp ult i32 %3, 8
  %28 = and i32 %3, -8
  %29 = icmp eq i32 %26, 0
  br label %30

30:                                               ; preds = %4, %35
  %31 = phi i32 [ %14, %4 ], [ %36, %35 ]
  %32 = icmp ult i32 %31, %3
  %33 = mul i32 %31, %3
  br label %38

34:                                               ; preds = %35
  ret void

35:                                               ; preds = %172
  %36 = add nsw i32 %31, 1
  %37 = icmp slt i32 %31, %25
  br i1 %37, label %30, label %34, !llvm.loop !7

38:                                               ; preds = %30, %172
  %39 = phi i32 [ %23, %30 ], [ %173, %172 ]
  %40 = icmp ult i32 %39, %3
  %41 = select i1 %32, i1 %40, i1 false
  br i1 %41, label %42, label %172

42:                                               ; preds = %38
  br i1 %27, label %43, label %70

43:                                               ; preds = %70, %42
  %44 = phi float [ undef, %42 ], [ %168, %70 ]
  %45 = phi i32 [ 0, %42 ], [ %169, %70 ]
  %46 = phi float [ 0.000000e+00, %42 ], [ %168, %70 ]
  br i1 %29, label %65, label %47

47:                                               ; preds = %43, %47
  %48 = phi i32 [ %62, %47 ], [ %45, %43 ]
  %49 = phi float [ %61, %47 ], [ %46, %43 ]
  %50 = phi i32 [ %63, %47 ], [ 0, %43 ]
  %51 = add i32 %48, %33
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !9
  %55 = mul i32 %48, %3
  %56 = add i32 %55, %39
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !9
  %60 = fmul contract float %54, %59
  %61 = fadd contract float %49, %60
  %62 = add nuw nsw i32 %48, 1
  %63 = add i32 %50, 1
  %64 = icmp eq i32 %63, %26
  br i1 %64, label %65, label %47, !llvm.loop !13

65:                                               ; preds = %47, %43
  %66 = phi float [ %44, %43 ], [ %61, %47 ]
  %67 = add i32 %39, %33
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  store float %66, float addrspace(1)* %69, align 4, !tbaa !9
  br label %172

70:                                               ; preds = %42, %70
  %71 = phi i32 [ %169, %70 ], [ 0, %42 ]
  %72 = phi float [ %168, %70 ], [ 0.000000e+00, %42 ]
  %73 = phi i32 [ %170, %70 ], [ 0, %42 ]
  %74 = add i32 %71, %33
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !9
  %78 = mul i32 %71, %3
  %79 = add i32 %78, %39
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !9
  %83 = fmul contract float %77, %82
  %84 = fadd contract float %72, %83
  %85 = or i32 %71, 1
  %86 = add i32 %85, %33
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !9
  %90 = mul i32 %85, %3
  %91 = add i32 %90, %39
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %2, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !9
  %95 = fmul contract float %89, %94
  %96 = fadd contract float %84, %95
  %97 = or i32 %71, 2
  %98 = add i32 %97, %33
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !9
  %102 = mul i32 %97, %3
  %103 = add i32 %102, %39
  %104 = zext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %2, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !9
  %107 = fmul contract float %101, %106
  %108 = fadd contract float %96, %107
  %109 = or i32 %71, 3
  %110 = add i32 %109, %33
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !9
  %114 = mul i32 %109, %3
  %115 = add i32 %114, %39
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %2, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !9
  %119 = fmul contract float %113, %118
  %120 = fadd contract float %108, %119
  %121 = or i32 %71, 4
  %122 = add i32 %121, %33
  %123 = zext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !9
  %126 = mul i32 %121, %3
  %127 = add i32 %126, %39
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %2, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !9
  %131 = fmul contract float %125, %130
  %132 = fadd contract float %120, %131
  %133 = or i32 %71, 5
  %134 = add i32 %133, %33
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !9
  %138 = mul i32 %133, %3
  %139 = add i32 %138, %39
  %140 = zext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %2, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !9
  %143 = fmul contract float %137, %142
  %144 = fadd contract float %132, %143
  %145 = or i32 %71, 6
  %146 = add i32 %145, %33
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %1, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !9
  %150 = mul i32 %145, %3
  %151 = add i32 %150, %39
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %2, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !9
  %155 = fmul contract float %149, %154
  %156 = fadd contract float %144, %155
  %157 = or i32 %71, 7
  %158 = add i32 %157, %33
  %159 = zext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %1, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !9
  %162 = mul i32 %157, %3
  %163 = add i32 %162, %39
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %2, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !9
  %167 = fmul contract float %161, %166
  %168 = fadd contract float %156, %167
  %169 = add nuw nsw i32 %71, 8
  %170 = add i32 %73, 8
  %171 = icmp eq i32 %170, %28
  br i1 %171, label %43, label %70, !llvm.loop !15

172:                                              ; preds = %38, %65
  %173 = add nsw i32 %39, 1
  %174 = icmp slt i32 %39, %24
  br i1 %174, label %38, label %35, !llvm.loop !16
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !8}
!16 = distinct !{!16, !8}
