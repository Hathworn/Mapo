; ModuleID = '../data/hip_kernels/1187/23/main.cu'
source_filename = "../data/hip_kernels/1187/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19lga_filter_backwardiPKfS0_iiiiPf(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %193

19:                                               ; preds = %8
  %20 = mul nsw i32 %4, %3
  %21 = shl nsw i32 %6, 1
  %22 = add nuw nsw i32 %21, 1
  %23 = mul i32 %22, %22
  %24 = mul i32 %23, 3
  %25 = mul i32 %24, %20
  %26 = sdiv i32 %17, %25
  %27 = mul nsw i32 %20, %5
  %28 = mul nsw i32 %27, %26
  %29 = freeze i32 %17
  %30 = freeze i32 %20
  %31 = sdiv i32 %29, %30
  %32 = mul i32 %31, %30
  %33 = sub i32 %29, %32
  %34 = add nsw i32 %28, %33
  %35 = srem i32 %31, %24
  %36 = sdiv i32 %35, %23
  %37 = add nsw i32 %36, -1
  %38 = freeze i32 %35
  %39 = freeze i32 %22
  %40 = sdiv i32 %38, %39
  %41 = srem i32 %40, %22
  %42 = sub nsw i32 %41, %6
  %43 = mul i32 %40, %39
  %44 = sub i32 %38, %43
  %45 = sub nsw i32 %44, %6
  %46 = sdiv i32 %33, %4
  %47 = add nsw i32 %46, %42
  %48 = srem i32 %17, %4
  %49 = add nsw i32 %48, %45
  %50 = icmp sgt i32 %5, 0
  br i1 %50, label %51, label %193

51:                                               ; preds = %19
  %52 = icmp sgt i32 %47, -1
  %53 = icmp sgt i32 %49, -1
  %54 = select i1 %52, i1 %53, i1 false
  %55 = icmp slt i32 %47, %3
  %56 = icmp slt i32 %49, %4
  %57 = sext i32 %17 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %7, i64 %57
  %59 = mul nsw i32 %42, %4
  %60 = mul nsw i32 %37, %20
  %61 = and i32 %5, 3
  %62 = icmp ult i32 %5, 4
  br i1 %62, label %162, label %63

63:                                               ; preds = %51
  %64 = and i32 %5, -4
  br label %65

65:                                               ; preds = %65, %63
  %66 = phi i32 [ 0, %63 ], [ %159, %65 ]
  %67 = phi i32 [ 0, %63 ], [ %160, %65 ]
  %68 = add nsw i32 %66, %37
  %69 = icmp sgt i32 %68, -1
  %70 = select i1 %54, i1 %69, i1 false
  %71 = select i1 %70, i1 %55, i1 false
  %72 = select i1 %71, i1 %56, i1 false
  %73 = icmp slt i32 %68, %5
  %74 = select i1 %72, i1 %73, i1 false
  %75 = mul nsw i32 %66, %20
  %76 = add i32 %75, %34
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %2, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = add i32 %76, %60
  %81 = add i32 %80, %45
  %82 = add i32 %81, %59
  %83 = sext i32 %82 to i64
  %84 = select i1 %74, i64 %83, i64 %77
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = fmul contract float %79, %86
  %88 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %89 = fadd contract float %88, %87
  store float %89, float addrspace(1)* %58, align 4, !tbaa !7
  %90 = or i32 %66, 1
  %91 = add i32 %66, %36
  %92 = icmp sgt i32 %91, -1
  %93 = select i1 %54, i1 %92, i1 false
  %94 = select i1 %93, i1 %55, i1 false
  %95 = select i1 %94, i1 %56, i1 false
  %96 = icmp slt i32 %91, %5
  %97 = select i1 %95, i1 %96, i1 false
  %98 = mul nsw i32 %90, %20
  %99 = add i32 %98, %34
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %2, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = add i32 %99, %60
  %104 = add i32 %103, %45
  %105 = add i32 %104, %59
  %106 = sext i32 %105 to i64
  %107 = select i1 %97, i64 %106, i64 %100
  %108 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7
  %110 = fmul contract float %102, %109
  %111 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %112 = fadd contract float %111, %110
  store float %112, float addrspace(1)* %58, align 4, !tbaa !7
  %113 = or i32 %66, 2
  %114 = add nsw i32 %113, %37
  %115 = icmp sgt i32 %114, -1
  %116 = select i1 %54, i1 %115, i1 false
  %117 = select i1 %116, i1 %55, i1 false
  %118 = select i1 %117, i1 %56, i1 false
  %119 = icmp slt i32 %114, %5
  %120 = select i1 %118, i1 %119, i1 false
  %121 = mul nsw i32 %113, %20
  %122 = add i32 %121, %34
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %2, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7
  %126 = add i32 %122, %60
  %127 = add i32 %126, %45
  %128 = add i32 %127, %59
  %129 = sext i32 %128 to i64
  %130 = select i1 %120, i64 %129, i64 %123
  %131 = getelementptr inbounds float, float addrspace(1)* %1, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7
  %133 = fmul contract float %125, %132
  %134 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %135 = fadd contract float %134, %133
  store float %135, float addrspace(1)* %58, align 4, !tbaa !7
  %136 = or i32 %66, 3
  %137 = add nsw i32 %136, %37
  %138 = icmp sgt i32 %137, -1
  %139 = select i1 %54, i1 %138, i1 false
  %140 = select i1 %139, i1 %55, i1 false
  %141 = select i1 %140, i1 %56, i1 false
  %142 = icmp slt i32 %137, %5
  %143 = select i1 %141, i1 %142, i1 false
  %144 = mul nsw i32 %136, %20
  %145 = add i32 %144, %34
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %2, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7
  %149 = add i32 %145, %60
  %150 = add i32 %149, %45
  %151 = add i32 %150, %59
  %152 = sext i32 %151 to i64
  %153 = select i1 %143, i64 %152, i64 %146
  %154 = getelementptr inbounds float, float addrspace(1)* %1, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7
  %156 = fmul contract float %148, %155
  %157 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %158 = fadd contract float %157, %156
  store float %158, float addrspace(1)* %58, align 4, !tbaa !7
  %159 = add nuw nsw i32 %66, 4
  %160 = add i32 %67, 4
  %161 = icmp eq i32 %160, %64
  br i1 %161, label %162, label %65, !llvm.loop !11

162:                                              ; preds = %65, %51
  %163 = phi i32 [ 0, %51 ], [ %159, %65 ]
  %164 = icmp eq i32 %61, 0
  br i1 %164, label %193, label %165

165:                                              ; preds = %162, %165
  %166 = phi i32 [ %190, %165 ], [ %163, %162 ]
  %167 = phi i32 [ %191, %165 ], [ 0, %162 ]
  %168 = add nsw i32 %166, %37
  %169 = icmp sgt i32 %168, -1
  %170 = select i1 %54, i1 %169, i1 false
  %171 = select i1 %170, i1 %55, i1 false
  %172 = select i1 %171, i1 %56, i1 false
  %173 = icmp slt i32 %168, %5
  %174 = select i1 %172, i1 %173, i1 false
  %175 = mul nsw i32 %166, %20
  %176 = add i32 %175, %34
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %2, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !7
  %180 = add i32 %176, %60
  %181 = add i32 %180, %45
  %182 = add i32 %181, %59
  %183 = sext i32 %182 to i64
  %184 = select i1 %174, i64 %183, i64 %177
  %185 = getelementptr inbounds float, float addrspace(1)* %1, i64 %184
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !7
  %187 = fmul contract float %179, %186
  %188 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %189 = fadd contract float %188, %187
  store float %189, float addrspace(1)* %58, align 4, !tbaa !7
  %190 = add nuw nsw i32 %166, 1
  %191 = add i32 %167, 1
  %192 = icmp eq i32 %191, %61
  br i1 %192, label %193, label %165, !llvm.loop !13

193:                                              ; preds = %162, %165, %19, %8
  ret void
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
