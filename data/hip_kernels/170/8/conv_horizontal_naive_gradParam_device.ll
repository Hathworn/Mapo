; ModuleID = '../data/hip_kernels/170/8/main.cu'
source_filename = "../data/hip_kernels/170/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z31conv_horizontal_naive_gradParamiPfPKfS1_iii(i32 %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !6
  %17 = mul i32 %8, %13
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %0
  br i1 %20, label %21, label %37

21:                                               ; preds = %7
  %22 = add nsw i32 %4, -1
  %23 = add i32 %22, %6
  %24 = mul i32 %6, %5
  %25 = icmp sgt i32 %5, 0
  %26 = icmp sgt i32 %6, 0
  %27 = udiv i32 %16, %13
  %28 = mul i32 %27, %13
  %29 = icmp ugt i32 %16, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %31, %13
  %33 = and i32 %6, 7
  %34 = icmp ult i32 %6, 8
  %35 = and i32 %6, -8
  %36 = icmp eq i32 %33, 0
  br label %38

37:                                               ; preds = %55, %7
  ret void

38:                                               ; preds = %21, %55
  %39 = phi i32 [ %19, %21 ], [ %56, %55 ]
  %40 = freeze i32 %39
  %41 = freeze i32 %4
  %42 = sdiv i32 %40, %41
  %43 = mul i32 %24, %42
  %44 = mul i32 %42, %41
  %45 = sub i32 %40, %44
  br i1 %25, label %46, label %55

46:                                               ; preds = %38
  %47 = sext i32 %39 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  br label %49

49:                                               ; preds = %46, %80
  %50 = phi i32 [ 0, %46 ], [ %81, %80 ]
  br i1 %26, label %51, label %80

51:                                               ; preds = %49
  %52 = mul nsw i32 %50, %6
  %53 = mul nsw i32 %50, %23
  %54 = load float, float addrspace(1)* %48, align 4, !tbaa !16
  br i1 %34, label %58, label %83

55:                                               ; preds = %80, %38
  %56 = add i32 %32, %39
  %57 = icmp slt i32 %56, %0
  br i1 %57, label %38, label %37, !llvm.loop !20

58:                                               ; preds = %83, %51
  %59 = phi float [ %54, %51 ], [ %189, %83 ]
  %60 = phi i32 [ 0, %51 ], [ %190, %83 ]
  br i1 %36, label %80, label %61

61:                                               ; preds = %58, %61
  %62 = phi float [ %76, %61 ], [ %59, %58 ]
  %63 = phi i32 [ %77, %61 ], [ %60, %58 ]
  %64 = phi i32 [ %78, %61 ], [ 0, %58 ]
  %65 = add i32 %63, %43
  %66 = add i32 %65, %52
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %3, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !16
  %70 = add i32 %65, %45
  %71 = add i32 %70, %53
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !16
  %75 = fmul contract float %69, %74
  %76 = fadd contract float %62, %75
  store float %76, float addrspace(1)* %48, align 4, !tbaa !16
  %77 = add nuw nsw i32 %63, 1
  %78 = add i32 %64, 1
  %79 = icmp eq i32 %78, %33
  br i1 %79, label %80, label %61, !llvm.loop !22

80:                                               ; preds = %58, %61, %49
  %81 = add nuw nsw i32 %50, 1
  %82 = icmp eq i32 %81, %5
  br i1 %82, label %55, label %49, !llvm.loop !24

83:                                               ; preds = %51, %83
  %84 = phi float [ %189, %83 ], [ %54, %51 ]
  %85 = phi i32 [ %190, %83 ], [ 0, %51 ]
  %86 = phi i32 [ %191, %83 ], [ 0, %51 ]
  %87 = add i32 %85, %43
  %88 = add i32 %87, %52
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %3, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !16
  %92 = add i32 %87, %45
  %93 = add i32 %92, %53
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %97 = fmul contract float %91, %96
  %98 = fadd contract float %84, %97
  store float %98, float addrspace(1)* %48, align 4, !tbaa !16
  %99 = or i32 %85, 1
  %100 = add i32 %99, %43
  %101 = add i32 %100, %52
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %3, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16
  %105 = add i32 %100, %45
  %106 = add i32 %105, %53
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %2, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !16
  %110 = fmul contract float %104, %109
  %111 = fadd contract float %98, %110
  store float %111, float addrspace(1)* %48, align 4, !tbaa !16
  %112 = or i32 %85, 2
  %113 = add i32 %112, %43
  %114 = add i32 %113, %52
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %3, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !16
  %118 = add i32 %113, %45
  %119 = add i32 %118, %53
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %2, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !16
  %123 = fmul contract float %117, %122
  %124 = fadd contract float %111, %123
  store float %124, float addrspace(1)* %48, align 4, !tbaa !16
  %125 = or i32 %85, 3
  %126 = add i32 %125, %43
  %127 = add i32 %126, %52
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %3, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !16
  %131 = add i32 %126, %45
  %132 = add i32 %131, %53
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %2, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !16
  %136 = fmul contract float %130, %135
  %137 = fadd contract float %124, %136
  store float %137, float addrspace(1)* %48, align 4, !tbaa !16
  %138 = or i32 %85, 4
  %139 = add i32 %138, %43
  %140 = add i32 %139, %52
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %3, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !16
  %144 = add i32 %139, %45
  %145 = add i32 %144, %53
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %2, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !16
  %149 = fmul contract float %143, %148
  %150 = fadd contract float %137, %149
  store float %150, float addrspace(1)* %48, align 4, !tbaa !16
  %151 = or i32 %85, 5
  %152 = add i32 %151, %43
  %153 = add i32 %152, %52
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %3, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !16
  %157 = add i32 %152, %45
  %158 = add i32 %157, %53
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %2, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !16
  %162 = fmul contract float %156, %161
  %163 = fadd contract float %150, %162
  store float %163, float addrspace(1)* %48, align 4, !tbaa !16
  %164 = or i32 %85, 6
  %165 = add i32 %164, %43
  %166 = add i32 %165, %52
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %3, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !16
  %170 = add i32 %165, %45
  %171 = add i32 %170, %53
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %2, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !16
  %175 = fmul contract float %169, %174
  %176 = fadd contract float %163, %175
  store float %176, float addrspace(1)* %48, align 4, !tbaa !16
  %177 = or i32 %85, 7
  %178 = add i32 %177, %43
  %179 = add i32 %178, %52
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %3, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !16
  %183 = add i32 %178, %45
  %184 = add i32 %183, %53
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %2, i64 %185
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !16
  %188 = fmul contract float %182, %187
  %189 = fadd contract float %176, %188
  store float %189, float addrspace(1)* %48, align 4, !tbaa !16
  %190 = add nuw nsw i32 %85, 8
  %191 = add i32 %86, 8
  %192 = icmp eq i32 %191, %35
  br i1 %192, label %58, label %83, !llvm.loop !25
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
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !21}
