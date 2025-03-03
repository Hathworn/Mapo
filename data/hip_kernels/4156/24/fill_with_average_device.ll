; ModuleID = '../data/hip_kernels/4156/24/main.cu'
source_filename = "../data/hip_kernels/4156/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17fill_with_averagePhPiS0_i(i8 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 5
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = shl i32 %9, 5
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = add i32 %10, %11
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !5
  %17 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !14, !invariant.load !15
  %20 = zext i16 %19 to i32
  %21 = udiv i32 %16, %20
  %22 = mul i32 %21, %20
  %23 = icmp ugt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = shl i32 %25, 5
  %27 = mul nsw i32 %12, %26
  %28 = add nsw i32 %27, %8
  %29 = mul nsw i32 %28, 3
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %30
  %32 = load i8, i8 addrspace(1)* %31, align 1, !tbaa !16
  %33 = zext i8 %32 to i32
  %34 = add nsw i32 %29, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %35
  %37 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !16
  %38 = zext i8 %37 to i32
  %39 = add nuw nsw i32 %38, %33
  %40 = add nsw i32 %29, 2
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %41
  %43 = load i8, i8 addrspace(1)* %42, align 1, !tbaa !16
  %44 = zext i8 %43 to i32
  %45 = sub nsw i32 0, %44
  %46 = icmp eq i32 %39, %45
  br i1 %46, label %47, label %77

47:                                               ; preds = %4
  %48 = sdiv i32 %12, %3
  %49 = mul nsw i32 %48, %26
  %50 = sdiv i32 %8, %3
  %51 = add nsw i32 %49, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !19
  %55 = icmp sgt i32 %54, 0
  br i1 %55, label %56, label %77

56:                                               ; preds = %47
  %57 = mul nsw i32 %51, 3
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !19
  %61 = sdiv i32 %60, %54
  %62 = trunc i32 %61 to i8
  store i8 %62, i8 addrspace(1)* %31, align 1, !tbaa !16
  %63 = add nsw i32 %57, 1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !19
  %67 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !19
  %68 = sdiv i32 %66, %67
  %69 = trunc i32 %68 to i8
  store i8 %69, i8 addrspace(1)* %36, align 1, !tbaa !16
  %70 = add nsw i32 %57, 2
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !19
  %74 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !19
  %75 = sdiv i32 %73, %74
  %76 = trunc i32 %75 to i8
  store i8 %76, i8 addrspace(1)* %42, align 1, !tbaa !16
  br label %77

77:                                               ; preds = %56, %47, %4
  %78 = add nsw i32 %12, 8
  %79 = mul nsw i32 %78, %26
  %80 = add nsw i32 %79, %8
  %81 = mul nsw i32 %80, 3
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %82
  %84 = load i8, i8 addrspace(1)* %83, align 1, !tbaa !16
  %85 = zext i8 %84 to i32
  %86 = add nsw i32 %81, 1
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %87
  %89 = load i8, i8 addrspace(1)* %88, align 1, !tbaa !16
  %90 = zext i8 %89 to i32
  %91 = add nuw nsw i32 %90, %85
  %92 = add nsw i32 %81, 2
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %93
  %95 = load i8, i8 addrspace(1)* %94, align 1, !tbaa !16
  %96 = zext i8 %95 to i32
  %97 = sub nsw i32 0, %96
  %98 = icmp eq i32 %91, %97
  br i1 %98, label %99, label %129

99:                                               ; preds = %77
  %100 = sdiv i32 %78, %3
  %101 = mul nsw i32 %100, %26
  %102 = sdiv i32 %8, %3
  %103 = add nsw i32 %101, %102
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !19
  %107 = icmp sgt i32 %106, 0
  br i1 %107, label %108, label %129

108:                                              ; preds = %99
  %109 = mul nsw i32 %103, 3
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %110
  %112 = load i32, i32 addrspace(1)* %111, align 4, !tbaa !19
  %113 = sdiv i32 %112, %106
  %114 = trunc i32 %113 to i8
  store i8 %114, i8 addrspace(1)* %83, align 1, !tbaa !16
  %115 = add nsw i32 %109, 1
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %116
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !19
  %119 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !19
  %120 = sdiv i32 %118, %119
  %121 = trunc i32 %120 to i8
  store i8 %121, i8 addrspace(1)* %88, align 1, !tbaa !16
  %122 = add nsw i32 %109, 2
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %123
  %125 = load i32, i32 addrspace(1)* %124, align 4, !tbaa !19
  %126 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !19
  %127 = sdiv i32 %125, %126
  %128 = trunc i32 %127 to i8
  store i8 %128, i8 addrspace(1)* %94, align 1, !tbaa !16
  br label %129

129:                                              ; preds = %108, %99, %77
  %130 = add nsw i32 %12, 16
  %131 = mul nsw i32 %130, %26
  %132 = add nsw i32 %131, %8
  %133 = mul nsw i32 %132, 3
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %134
  %136 = load i8, i8 addrspace(1)* %135, align 1, !tbaa !16
  %137 = zext i8 %136 to i32
  %138 = add nsw i32 %133, 1
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %139
  %141 = load i8, i8 addrspace(1)* %140, align 1, !tbaa !16
  %142 = zext i8 %141 to i32
  %143 = add nuw nsw i32 %142, %137
  %144 = add nsw i32 %133, 2
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %145
  %147 = load i8, i8 addrspace(1)* %146, align 1, !tbaa !16
  %148 = zext i8 %147 to i32
  %149 = sub nsw i32 0, %148
  %150 = icmp eq i32 %143, %149
  br i1 %150, label %151, label %181

151:                                              ; preds = %129
  %152 = sdiv i32 %130, %3
  %153 = mul nsw i32 %152, %26
  %154 = sdiv i32 %8, %3
  %155 = add nsw i32 %153, %154
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %156
  %158 = load i32, i32 addrspace(1)* %157, align 4, !tbaa !19
  %159 = icmp sgt i32 %158, 0
  br i1 %159, label %160, label %181

160:                                              ; preds = %151
  %161 = mul nsw i32 %155, 3
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %162
  %164 = load i32, i32 addrspace(1)* %163, align 4, !tbaa !19
  %165 = sdiv i32 %164, %158
  %166 = trunc i32 %165 to i8
  store i8 %166, i8 addrspace(1)* %135, align 1, !tbaa !16
  %167 = add nsw i32 %161, 1
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %168
  %170 = load i32, i32 addrspace(1)* %169, align 4, !tbaa !19
  %171 = load i32, i32 addrspace(1)* %157, align 4, !tbaa !19
  %172 = sdiv i32 %170, %171
  %173 = trunc i32 %172 to i8
  store i8 %173, i8 addrspace(1)* %140, align 1, !tbaa !16
  %174 = add nsw i32 %161, 2
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %175
  %177 = load i32, i32 addrspace(1)* %176, align 4, !tbaa !19
  %178 = load i32, i32 addrspace(1)* %157, align 4, !tbaa !19
  %179 = sdiv i32 %177, %178
  %180 = trunc i32 %179 to i8
  store i8 %180, i8 addrspace(1)* %146, align 1, !tbaa !16
  br label %181

181:                                              ; preds = %160, %151, %129
  %182 = add nsw i32 %12, 24
  %183 = mul nsw i32 %182, %26
  %184 = add nsw i32 %183, %8
  %185 = mul nsw i32 %184, 3
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %186
  %188 = load i8, i8 addrspace(1)* %187, align 1, !tbaa !16
  %189 = zext i8 %188 to i32
  %190 = add nsw i32 %185, 1
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %191
  %193 = load i8, i8 addrspace(1)* %192, align 1, !tbaa !16
  %194 = zext i8 %193 to i32
  %195 = add nuw nsw i32 %194, %189
  %196 = add nsw i32 %185, 2
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %197
  %199 = load i8, i8 addrspace(1)* %198, align 1, !tbaa !16
  %200 = zext i8 %199 to i32
  %201 = sub nsw i32 0, %200
  %202 = icmp eq i32 %195, %201
  br i1 %202, label %203, label %233

203:                                              ; preds = %181
  %204 = sdiv i32 %182, %3
  %205 = mul nsw i32 %204, %26
  %206 = sdiv i32 %8, %3
  %207 = add nsw i32 %205, %206
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %208
  %210 = load i32, i32 addrspace(1)* %209, align 4, !tbaa !19
  %211 = icmp sgt i32 %210, 0
  br i1 %211, label %212, label %233

212:                                              ; preds = %203
  %213 = mul nsw i32 %207, 3
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %214
  %216 = load i32, i32 addrspace(1)* %215, align 4, !tbaa !19
  %217 = sdiv i32 %216, %210
  %218 = trunc i32 %217 to i8
  store i8 %218, i8 addrspace(1)* %187, align 1, !tbaa !16
  %219 = add nsw i32 %213, 1
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %220
  %222 = load i32, i32 addrspace(1)* %221, align 4, !tbaa !19
  %223 = load i32, i32 addrspace(1)* %209, align 4, !tbaa !19
  %224 = sdiv i32 %222, %223
  %225 = trunc i32 %224 to i8
  store i8 %225, i8 addrspace(1)* %192, align 1, !tbaa !16
  %226 = add nsw i32 %213, 2
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %227
  %229 = load i32, i32 addrspace(1)* %228, align 4, !tbaa !19
  %230 = load i32, i32 addrspace(1)* %209, align 4, !tbaa !19
  %231 = sdiv i32 %229, %230
  %232 = trunc i32 %231 to i8
  store i8 %232, i8 addrspace(1)* %198, align 1, !tbaa !16
  br label %233

233:                                              ; preds = %212, %203, %181
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !17, i64 0}
